// import 'package:aevon/core/shared/auth_session/datasource/local_storage/auth_session.dart';
// import 'package:aevon/core/shared/auth_session/datasource/remote/auth_session_remote_data_source.dart';
// import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
// import 'package:aevon/features/auth/data/models/user_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class AuthSessionCubit extends Cubit<AuthSessionState> {
//   final AuthSession _authSession;
//   final AuthSessionRemoteDataSource _remoteDataSource;

//   AuthSessionCubit(this._authSession, this._remoteDataSource)
//     : super(const AuthSessionState.initial()) {
//     fetchSession();
//   }

//   Future<void> syncUserData() async {
//     final remoteResult = await _remoteDataSource.getProfile();
//     remoteResult.when(
//       success: (data) async {
//         await _authSession.saveUserInfo(data.user);
//         if (data.token != null) {
//           await _authSession.saveToken(token: data.token!);
//         }
//         emit(state.copyWith(user: data.user, token: data.token ?? state.token));
//       },
//       error: (failure) {},
//     );
//   }

//   Future<void> fetchSession() async {
//     emit(state.copyWith(isLoading: true));
//     final user = _authSession.fetchUserInfo();
//     final token = _authSession.getToken();
//     emit(state.copyWith(user: user, token: token, isLoading: false));
//   }

//   Future<void> saveSession({required User user, required String token}) async {
//     await _authSession.saveUserInfo(user);
//     await _authSession.saveToken(token: token);
//     emit(state.copyWith(user: user, token: token));
//   }

//   Future<void> updateUser(User user) async {
//     await _authSession.saveUserInfo(user);
//     emit(state.copyWith(user: user));
//   }

//   Future<void> saveToken(String token) async {
//     await _authSession.saveToken(token: token);
//     emit(state.copyWith(token: token));
//   }

//   Future<void> clearSession() async {
//     await _authSession.clearSession();
//     emit(const AuthSessionState.initial());
//   }
// }
