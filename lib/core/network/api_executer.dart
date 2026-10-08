import 'package:dio/dio.dart';

import '../config/base_response/result.dart';
import '../errors/errors_handler.dart';

Future<Result<T>> executeApiCall<T>({
  required Future<Response<Map<String, dynamic>>> Function() apiCall,
  required T Function(Map<String, dynamic> data) parser,
}) async {
  try {
    final result = await apiCall();
    return Result<T>.success(parser(result.data ?? {}));
  } catch (e) {
    return Result<T>.error(ErrorHandler.handle(e).failure);
  }
}
