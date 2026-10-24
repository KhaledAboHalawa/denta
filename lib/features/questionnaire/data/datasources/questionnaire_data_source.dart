import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/core/network/api_executer.dart';
import 'package:denta/features/questionnaire/data/models/profile_extras_request_model.dart';
import 'package:denta/features/questionnaire/data/models/university_model.dart';
import 'package:denta/features/questionnaire/data/models/verification_info_request_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// NOTE: endpoints and field names below are assumptions until the backend
/// contract is available. Keep every change here, in this one file.
@lazySingleton
class QuestionnaireDataSource {
  final Dio _dio;

  QuestionnaireDataSource(this._dio);

  Future<Result<List<UniversityModel>>> getUniversities() async {
    return await executeApiCall(
      apiCall: () async {
        await Future.delayed(const Duration(seconds: 3));
        return Response(
          statusCode: 200,
          data: {
            "data": [
              {"id": 1, "name": "Cairo University", "country": "Egypt"},
              {"id": 2, "name": "Ain Shams University", "country": "Egypt"},
              {"id": 3, "name": "Alexandria University", "country": "Egypt"},
            ],
          },
          requestOptions: RequestOptions(),
        );
      },
      parser: (json) => (json['data'] as List? ?? [])
          .map((e) => UniversityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<Result<bool>> submitVerificationInfo(
    VerificationInfoRequestModel params,
  ) async {
    return await executeApiCall(
      apiCall: () async {
        await Future.delayed(const Duration(seconds: 3));
        return Response(
          statusCode: 200,
          data: null,
          requestOptions: RequestOptions(),
        );
        //  await _dio.post<Map<String, dynamic>>('/student/verification', data: await params.toFormData());
      },
      parser: (_) => true,
    );
  }

  Future<Result<bool>> saveProfileExtras(
    ProfileExtrasRequestModel params,
  ) async {
    return await executeApiCall(
      apiCall: () async => _dio.put<Map<String, dynamic>>(
        '/student/profile',
        data: await params.toFormData(),
      ),
      parser: (_) => true,
    );
  }
}
