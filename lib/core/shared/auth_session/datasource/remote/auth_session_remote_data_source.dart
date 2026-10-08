// import 'package:aevon/core/network/api_executer.dart';
// import 'package:aevon/core/shared/data/model/result.dart';
// import 'package:aevon/core/utils/app_constants.dart';
// import 'package:aevon/features/auth/data/models/auth_respons.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class AuthSessionRemoteDataSource {
//   final Dio _dio;
//   const AuthSessionRemoteDataSource(this._dio);

//   Future<Result<AuthResonse>> getProfile() async {
//     return await executeApiCall(
//       apiCall: () async => await _dio.get(ApiConstants.getProfile),
//       parser: (data) => AuthResonse.fromJson(data),
//     );
//   }
// }
