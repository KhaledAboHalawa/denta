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

import '../../features/forgot_password/presentation/bloc/forgot_password_bloc.dart'
    as _i161;
import '../../features/notifications/data/datasources/notifications_local_data_source.dart'
    as _i1034;
import '../../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i201;
import '../../features/notifications/domain/repositories/notifications_repository.dart'
    as _i563;
import '../../features/notifications/domain/usecases/delete_notification_use_case.dart'
    as _i1005;
import '../../features/notifications/domain/usecases/get_notifications_use_case.dart'
    as _i373;
import '../../features/notifications/domain/usecases/mark_all_notifications_read_use_case.dart'
    as _i736;
import '../../features/notifications/domain/usecases/mark_notification_read_use_case.dart'
    as _i734;
import '../../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i1041;
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
import '../../features/questionnaire/data/datasources/questionnaire_data_source.dart'
    as _i945;
import '../../features/questionnaire/data/repositories/questionnaire_repo_impl.dart'
    as _i521;
import '../../features/questionnaire/domain/repositories/questionnaire_repo.dart'
    as _i1006;
import '../../features/questionnaire/domain/usecases/get_universities_use_case.dart'
    as _i920;
import '../../features/questionnaire/domain/usecases/save_profile_extras_use_case.dart'
    as _i500;
import '../../features/questionnaire/domain/usecases/submit_verification_info_use_case.dart'
    as _i672;
import '../../features/questionnaire/presentation/cubit/questionnaire_cubit.dart'
    as _i876;
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
    gh.lazySingleton<_i161.ForgotPasswordCubit>(
      () => _i161.ForgotPasswordCubit(),
    );
    gh.lazySingleton<_i1034.NotificationsLocalDataSource>(
      () => _i1034.NotificationsLocalDataSource(),
    );
    gh.lazySingleton<_i640.SignInCubit>(() => _i640.SignInCubit());
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i563.NotificationsRepository>(
      () => _i201.NotificationsRepositoryImpl(
        localDataSource: gh<_i1034.NotificationsLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i945.QuestionnaireDataSource>(
      () => _i945.QuestionnaireDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i477.RegisterDataSource>(
      () => _i477.RegisterDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1006.QuestionnaireRepo>(
      () => _i521.QuestionnaireRepoImpl(
        questionnaireDataSource: gh<_i945.QuestionnaireDataSource>(),
      ),
    );
    gh.lazySingleton<_i1005.DeleteNotificationUseCase>(
      () => _i1005.DeleteNotificationUseCase(
        repository: gh<_i563.NotificationsRepository>(),
      ),
    );
    gh.lazySingleton<_i373.GetNotificationsUseCase>(
      () => _i373.GetNotificationsUseCase(
        repository: gh<_i563.NotificationsRepository>(),
      ),
    );
    gh.lazySingleton<_i736.MarkAllNotificationsReadUseCase>(
      () => _i736.MarkAllNotificationsReadUseCase(
        repository: gh<_i563.NotificationsRepository>(),
      ),
    );
    gh.lazySingleton<_i734.MarkNotificationReadUseCase>(
      () => _i734.MarkNotificationReadUseCase(
        repository: gh<_i563.NotificationsRepository>(),
      ),
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
    gh.lazySingleton<_i1041.NotificationsCubit>(
      () => _i1041.NotificationsCubit(
        gh<_i373.GetNotificationsUseCase>(),
        gh<_i734.MarkNotificationReadUseCase>(),
        gh<_i736.MarkAllNotificationsReadUseCase>(),
        gh<_i1005.DeleteNotificationUseCase>(),
      ),
    );
    gh.lazySingleton<_i441.RegisterUseCase>(
      () => _i441.RegisterUseCase(registerRepo: gh<_i250.RegisterRepo>()),
    );
    gh.lazySingleton<_i920.GetUniversitiesUseCase>(
      () => _i920.GetUniversitiesUseCase(
        questionnaireRepo: gh<_i1006.QuestionnaireRepo>(),
      ),
    );
    gh.lazySingleton<_i500.SaveProfileExtrasUseCase>(
      () => _i500.SaveProfileExtrasUseCase(
        questionnaireRepo: gh<_i1006.QuestionnaireRepo>(),
      ),
    );
    gh.lazySingleton<_i672.SubmitVerificationInfoUseCase>(
      () => _i672.SubmitVerificationInfoUseCase(
        questionnaireRepo: gh<_i1006.QuestionnaireRepo>(),
      ),
    );
    gh.factory<_i876.QuestionnaireCubit>(
      () => _i876.QuestionnaireCubit(
        gh<_i920.GetUniversitiesUseCase>(),
        gh<_i672.SubmitVerificationInfoUseCase>(),
        gh<_i500.SaveProfileExtrasUseCase>(),
      ),
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
