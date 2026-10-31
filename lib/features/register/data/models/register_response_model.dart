import 'package:denta/features/register/domain/entities/register_entity.dart';

class RegisterResponseModel {
  final String token;
  final String refreshToken;
  final String user;
  RegisterResponseModel({
    required this.token,
    required this.refreshToken,
    required this.user,
  });
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        token: json['token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
        user: json['user'] ?? '',
      );

  RegisterEntity toEntity() {
    return RegisterEntity(token: token, refreshToken: refreshToken, user: user);
  }
}
