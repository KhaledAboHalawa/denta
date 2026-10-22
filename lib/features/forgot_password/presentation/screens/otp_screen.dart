import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../domain/entities/otp_request_params.dart';
import '../bloc/otp_bloc.dart';
import '../widgets/otp_body.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OtpCubit>()
        ..doIntent(OtpInitializeEvent(params: OtpRequestParams(email: email))),
      child: const Scaffold(body: SafeArea(child: OtpBody())),
    );
  }
}
