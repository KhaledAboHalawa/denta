import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/features/onboarding/presentation/widgets/page_onboarding_1.dart';
import 'package:denta/features/onboarding/presentation/widgets/page_onboarding_2.dart';
import 'package:denta/features/onboarding/presentation/widgets/page_onboarding_3.dart';
import 'package:denta/features/onboarding/presentation/widgets/page_onboarding_4.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  void _nextPage() {
    if (_pageController.page == null) return;

    if (_pageController.page! < 3) {
      _pageController.jumpToPage(_pageController.page!.round() + 1);
    } else {
      _createAccount();
    }
  }

  void _skipOnboarding() {
    _pageController.jumpToPage(3);
  }

  void _login() {}

  void _createAccount() {
    context.go(RoutePaths.roleSelectionPath);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PageOnboarding1(onNext: _nextPage, onLogin: _login),
          PageOnboarding2(
            onNext: _nextPage,
            onSkip: _skipOnboarding,
            onLogin: _login,
          ),
          PageOnboarding3(
            onNext: _nextPage,
            onSkip: _skipOnboarding,
            onLogin: _login,
          ),
          PageOnboarding4(onCreateAccount: _createAccount, onLogin: _login),
        ],
      ),
    );
  }
}
