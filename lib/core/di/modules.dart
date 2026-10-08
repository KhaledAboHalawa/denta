import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => 'My base url';

  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: baseUrl));

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}