// import 'dart:developer';

// import 'package:aevon/core/utils/app_constants.dart';
// import 'package:aevon/features/auth/data/models/user_model.dart';
// import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// @lazySingleton
// class AuthSession {
//   final SharedPreferences _preferences;
//   const AuthSession(this._preferences);

//   Future<bool> saveUserInfo(User? user) async {
//     if (user == null) {
//       return false;
//     }
//     try {
//       return await _preferences.setStringList(AppKeys.userInfo, user.toList());
//     } catch (e) {
//       return false;
//     }
//   }

//   User? fetchUserInfo() {
//     try {
//       final userInfo = _preferences.getStringList(AppKeys.userInfo);
//       log(userInfo.toString());
//       return userInfo != null ? User.fromList(userInfo) : null;
//     } catch (e) {
//       return null;
//     }
//   }

//   String? getToken() => _preferences.getString(AppKeys.token);

//   Future<bool> saveToken({required String token}) async {
//     try {
//       return await _preferences.setString(AppKeys.token, token);
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> clearSession() async {
//     try {
//       await _preferences.remove(AppKeys.token);
//       await _preferences.remove(AppKeys.userInfo);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
