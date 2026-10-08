import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/di/dependency_injection.dart';
import 'core/localization/locale_cubit.dart';
import 'core/shared/theming/cubit/theming_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<ThemeCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
