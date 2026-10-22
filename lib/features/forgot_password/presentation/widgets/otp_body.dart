import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/otp_bloc.dart';
import 'otp_form.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remaining = (seconds % 60).toString().padLeft(2, '0');

    return '$minutes:$remaining';
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<OtpCubit, OtpState>(
        listenWhen: (previous, current) =>
            previous.response.status != current.response.status ||
            previous.resendResponse.status != current.resendResponse.status,
        listener: (context, state) {
          if (state.response.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (state.response.error?.isNotEmpty ?? false)
                      ? state.response.error!
                      : locale.otpVerificationFailed,
                ),
              ),
            );
          }

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

          if (state.response.isSuccess) {
            context.go(RoutePaths.resetPasswordPath);
          }
        },
        child: Column(
          children: [
            AuthAppBar(
              onlyLogo: false,
              onBack: () => Navigator.of(context).pop(),
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
                              AuthTextBanner(
                                title: locale.otpTitle,
                                subTitle: locale.otpDescription(
                                  context.read<OtpCubit>().state.params.email,
                                ),
                              ),
                              const SizedBox(height: 37),
                              const OtpForm(),
                              const SizedBox(height: 24),
                              BlocBuilder<OtpCubit, OtpState>(
                                buildWhen: (previous, current) =>
                                    previous.remainingSeconds !=
                                    current.remainingSeconds,
                                builder: (context, state) {
                                  return Text(
                                    _formatTime(state.remainingSeconds),
                                    style: context.text.captionDefault.copyWith(
                                      color: context.appColors.textMain,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 6),
                              BlocBuilder<OtpCubit, OtpState>(
                                buildWhen: (previous, current) =>
                                    previous.remainingSeconds !=
                                        current.remainingSeconds ||
                                    previous.resendResponse.status !=
                                        current.resendResponse.status,
                                builder: (context, state) {
                                  final canResend =
                                      state.remainingSeconds == 0 &&
                                      !state.resendResponse.isLoading;

                                  return Wrap(
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        '${locale.didntGetIt} ',
                                        style: context.text.labelDefault
                                            .copyWith(
                                              color: context.appColors.textMain,
                                            ),
                                      ),
                                      TextButton(
                                        onPressed: canResend
                                            ? () {
                                                context
                                                    .read<OtpCubit>()
                                                    .doIntent(
                                                      const OtpResendEvent(),
                                                    );
                                              }
                                            : null,
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: Text(
                                          locale.resendCode,
                                          style: context.text.labelDefault
                                              .copyWith(
                                                color: canResend
                                                    ? context.appColors.primary
                                                    : context.appColors.info,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
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
    );
  }
}
