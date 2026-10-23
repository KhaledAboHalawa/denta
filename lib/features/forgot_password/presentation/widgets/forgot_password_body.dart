import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/forgot_password_bloc.dart';
import 'process_widget.dart';
import 'text_hints_widget.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.response.status != current.response.status,
        listener: (context, state) {
          if (state.response.isError) {
            final message = state.response.error;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message != null && message.isNotEmpty
                      ? message
                      : locale.otpVerificationFailed,
                ),
              ),
            );
          }
        },
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listenWhen: (previous, current) =>
              previous.resendResponse.status != current.resendResponse.status,
          listener: (context, state) {
            if (state.resendResponse.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.resendResponse.error ?? locale.otpResendFailed,
                  ),
                ),
              );
            }

            if (state.resendResponse.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(locale.otpResendMockSuccess)),
              );
            }
          },
          child: Column(
            children: [
              AuthAppBar(
                onlyLogo: false,
                onBack: () {
                  final cubit = context.read<ForgotPasswordCubit>();

                  if (cubit.state.currentPage > 0) {
                    cubit.doIntent(
                      ForgotPasswordGoToPageEvent(
                        page: cubit.state.currentPage - 1,
                      ),
                    );
                  } else {
                    context.pop();
                  }
                },
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.manual,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const TextHintsWidget(),
                                const SizedBox(height: 37),
                                const ProcessWidget(),
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
