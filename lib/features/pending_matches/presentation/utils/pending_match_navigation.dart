import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/route_paths.dart';

extension PendingMatchNavigation on BuildContext {
  /// Read-only details of a match that is still searching for patients.
  void openMatchDetails(String matchId) =>
      pushNamed(RoutePaths.matchDetailsPath, pathParameters: {'id': matchId});

  /// Back to the case request so the student can fix the requested changes.
  void editMatch(String matchId) =>
      pushNamed(RoutePaths.editMatchPath, pathParameters: {'id': matchId});
}
