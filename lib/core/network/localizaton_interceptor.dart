import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../localization/locale_cubit.dart';

@lazySingleton
class LocalizatonInterceptor extends Interceptor {
  final LocaleCubit _localizationCubit;

  LocalizatonInterceptor(this._localizationCubit);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[''] = _localizationCubit.state.languageCode;
    super.onRequest(options, handler);
  }
}
