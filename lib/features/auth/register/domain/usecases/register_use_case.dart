import 'package:injectable/injectable.dart';

import '../../../../../core/config/base_response/result.dart';
import '../entities/register_entity.dart';
import '../entities/register_request_params.dart';
import '../repositories/register_repo.dart';
@lazySingleton
class RegisterUseCase {
  final RegisterRepo registerRepo;
  RegisterUseCase({required this.registerRepo});
  Future<Result<RegisterEntity>> call(RegisterRequestParams params) async {
    return await registerRepo.register(params);
  }
}