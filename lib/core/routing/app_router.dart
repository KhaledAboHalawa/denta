import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/register/presentation/screens/register_screen.dart';
import '../../features/sign_in/presentation/screens/sign_in_screen.dart';
import '../../features/user_role_selection/presentation/screens/role_selection_screen.dart';
import '../../features/user_role_selection/presentation/widgets/role_selection_section.dart';
import 'route_paths.dart';

enum SlideDirection {
  fromTrailing,
  fromLeading,
  fromRight,
  fromLeft,
  fromBottom,
  fromTop,
}

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.roleSelectionPath,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.registerPath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          key: state.pageKey,
          child: RegisterScreen(role: state.extra as UserRole),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.roleSelectionPath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          key: state.pageKey,
          child: const RoleSelectionScreen(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.signInPath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          key: state.pageKey,
          child: const SignInScreen(),
        );
      },
    ),
  ],
);

//  ===================================Custom slide transition page for GoRouter=======================================

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required super.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    super.transitionDuration = const Duration(milliseconds: 350),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
    SlideDirection direction = SlideDirection.fromTrailing,
    Curve curve = Curves.easeInOutCubic,
    Curve reverseCurve = Curves.easeInOutCubic,
    bool enableParallax = true,
    bool enableFade = false,
  }) : super(
         transitionsBuilder:
             (
               BuildContext context,
               Animation<double> animation,
               Animation<double> secondaryAnimation,
               Widget child,
             ) {
               final primaryBegin = _getPrimaryBeginOffset(direction, context);
               final secondaryEnd = _getSecondaryEndOffset(direction, context);

               // Primary slide animation (entering screen)
               final primaryCurve = CurvedAnimation(
                 parent: animation,
                 curve: curve,
                 reverseCurve: reverseCurve,
               );
               final primarySlideTween = Tween<Offset>(
                 begin: primaryBegin,
                 end: Offset.zero,
               ).animate(primaryCurve);

               Widget animatedChild = SlideTransition(
                 position: primarySlideTween,
                 child: child,
               );

               // Optional subtle fade effect
               if (enableFade) {
                 final fadeCurve = CurvedAnimation(
                   parent: animation,
                   curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
                 );
                 animatedChild = FadeTransition(
                   opacity: fadeCurve,
                   child: animatedChild,
                 );
               }

               // Secondary parallax motion (outgoing screen slides back slightly)
               if (enableParallax) {
                 final secondaryCurve = CurvedAnimation(
                   parent: secondaryAnimation,
                   curve: curve,
                   reverseCurve: reverseCurve,
                 );
                 final secondarySlideTween = Tween<Offset>(
                   begin: Offset.zero,
                   end: secondaryEnd,
                 ).animate(secondaryCurve);

                 animatedChild = SlideTransition(
                   position: secondarySlideTween,
                   child: animatedChild,
                 );
               }

               return animatedChild;
             },
       );

  static Offset _getPrimaryBeginOffset(
    SlideDirection direction,
    BuildContext context,
  ) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    switch (direction) {
      case SlideDirection.fromTrailing:
        return Offset(isRtl ? -1.0 : 1.0, 0.0);
      case SlideDirection.fromLeading:
        return Offset(isRtl ? 1.0 : -1.0, 0.0);
      case SlideDirection.fromRight:
        return const Offset(1.0, 0.0);
      case SlideDirection.fromLeft:
        return const Offset(-1.0, 0.0);
      case SlideDirection.fromBottom:
        return const Offset(0.0, 1.0);
      case SlideDirection.fromTop:
        return const Offset(0.0, -1.0);
    }
  }

  static Offset _getSecondaryEndOffset(
    SlideDirection direction,
    BuildContext context,
  ) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    switch (direction) {
      case SlideDirection.fromTrailing:
        return Offset(isRtl ? 0.25 : -0.25, 0.0);
      case SlideDirection.fromLeading:
        return Offset(isRtl ? -0.25 : 0.25, 0.0);
      case SlideDirection.fromRight:
        return const Offset(-0.25, 0.0);
      case SlideDirection.fromLeft:
        return const Offset(0.25, 0.0);
      case SlideDirection.fromBottom:
        return const Offset(0.0, -0.1);
      case SlideDirection.fromTop:
        return const Offset(0.0, 0.1);
    }
  }
}

/// Helper function to build a [SlideTransitionPage].
Page<dynamic> buildSlideTransitionPage({
  required GoRouterState state,
  required Widget child,
  SlideDirection direction = SlideDirection.fromTrailing,
  Duration duration = const Duration(milliseconds: 350),
  Duration reverseDuration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOutCubic,
  Curve reverseCurve = Curves.easeInOutCubic,
  bool enableParallax = true,
  bool enableFade = false,
}) {
  return SlideTransitionPage(
    key: state.pageKey,
    direction: direction,
    transitionDuration: duration,
    reverseTransitionDuration: reverseDuration,
    curve: curve,
    reverseCurve: reverseCurve,
    enableParallax: enableParallax,
    enableFade: enableFade,
    child: child,
  );
}
