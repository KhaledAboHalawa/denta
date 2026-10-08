// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../localization/locale_cubit.dart' as _i960;
import '../network/localizaton_interceptor.dart' as _i356;
import '../shared/theming/cubit/theming_cubit.dart' as _i137;
import 'modules.dart' as _i738;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i960.LocaleCubit>(
      () => _i960.LocaleCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i137.ThemeCubit>(
      () => _i137.ThemeCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i356.LocalizatonInterceptor>(
      () => _i356.LocalizatonInterceptor(gh<_i960.LocaleCubit>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i738.RegisterModule {}
