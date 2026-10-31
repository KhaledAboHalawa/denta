import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/network/api_executer.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

@lazySingleton
class RegisterDataSource {
  final Dio _dio;

  RegisterDataSource(this._dio);

  Future<Result<RegisterResponseModel>> register(
    RegisterRequestModel params,
  ) async {
    return await executeApiCall(
      apiCall: () async {
        _dio.post('/Wating', data: params.toJson());
        await Future.delayed(const Duration(seconds: 2));
        return Response(
          statusCode: 200,
          data: {
            'token': 'token',
            'refresh_token': 'refreshToken',
            'user': null,
          },
          requestOptions: RequestOptions(),
        );
      },
      parser: (json) => RegisterResponseModel.fromJson(json),
    );
  }
}
