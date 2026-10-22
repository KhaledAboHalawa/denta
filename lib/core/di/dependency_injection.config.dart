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

import '../../features/onboarding/data/data_source/onboarding_data_source.dart'
    as _i304;
import '../../features/onboarding/data/repo/onboarding_repo_impl.dart' as _i527;
import '../../features/onboarding/domain/repo/onboarding_repo.dart' as _i211;
import '../../features/onboarding/domain/use_case/get_onboarding_status_use_case.dart'
    as _i386;
import '../../features/onboarding/domain/use_case/save_onboarding_completion_use_case.dart'
    as _i551;
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i807;
import '../../features/register/data/datasources/register_data_source.dart'
    as _i477;
import '../../features/register/data/repositories/register_repo_impl.dart'
    as _i200;
import '../../features/register/domain/repositories/register_repo.dart'
    as _i250;
import '../../features/register/domain/usecases/register_use_case.dart'
    as _i441;
import '../../features/register/presentation/bloc/register_bloc.dart' as _i771;
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart' as _i640;
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
    gh.lazySingleton<_i640.SignInCubit>(() => _i640.SignInCubit());
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i477.RegisterDataSource>(
      () => _i477.RegisterDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i960.LocaleCubit>(
      () => _i960.LocaleCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i137.ThemeCubit>(
      () => _i137.ThemeCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i304.OnboardingDataSource>(
      () => _i304.OnboardingDataSource(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i250.RegisterRepo>(
      () => _i200.RegisterRepoImpl(
        registerDataSource: gh<_i477.RegisterDataSource>(),
      ),
    );
    gh.lazySingleton<_i441.RegisterUseCase>(
      () => _i441.RegisterUseCase(registerRepo: gh<_i250.RegisterRepo>()),
    );
    gh.lazySingleton<_i771.RegisterBloc>(
      () => _i771.RegisterBloc(gh<_i441.RegisterUseCase>()),
    );
    gh.lazySingleton<_i356.LocalizatonInterceptor>(
      () => _i356.LocalizatonInterceptor(gh<_i960.LocaleCubit>()),
    );
    gh.lazySingleton<_i386.GetOnboardingStatusUseCase>(
      () => _i386.GetOnboardingStatusUseCase(
        onboardingDataSource: gh<_i304.OnboardingDataSource>(),
      ),
    );
    gh.lazySingleton<_i551.SaveOnboardingCompletionUseCase>(
      () => _i551.SaveOnboardingCompletionUseCase(
        onboardingDataSource: gh<_i304.OnboardingDataSource>(),
      ),
    );
    gh.lazySingleton<_i807.OnboardingCubit>(
      () => _i807.OnboardingCubit(gh<_i551.SaveOnboardingCompletionUseCase>()),
    );
    gh.lazySingleton<_i211.OnboardingRepo>(
      () => _i527.OnboardingRepoImpl(
        onboardingDataSource: gh<_i304.OnboardingDataSource>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i738.RegisterModule {}
