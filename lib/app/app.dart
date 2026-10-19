import 'package:denta/core/localization/locale_cubit.dart';
import 'package:denta/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/l10n/app_localizations.dart';
import '../core/shared/theming/cubit/theming_cubit.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;
    final themeMode = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      locale: locale,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
