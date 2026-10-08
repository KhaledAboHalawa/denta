// import 'package:aevon/features/auth/data/models/user_model.dart';
// import 'package:equatable/equatable.dart';

// class AuthSessionState extends Equatable {
//   final User? user;
//   final String? token;
//   final bool isLoading;

//   const AuthSessionState({
//     this.user,
//     this.token,
//     this.isLoading = false,
//   });

//   const AuthSessionState.initial()
//       : user = null,
//         token = null,
//         isLoading = false;

//   bool get isLoggedIn => token != null && token!.isNotEmpty;

//   AuthSessionState copyWith({
//     User? user,
//     String? token,
//     bool? isLoading,
//   }) {
//     return AuthSessionState(
//       user: user ?? this.user,
//       token: token ?? this.token,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }

//   @override
//   List<Object?> get props => [user, token, isLoading];
// }
