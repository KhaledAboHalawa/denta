import 'package:denta/features/register/domain/entities/register_request_params.dart';
import '../../../../core/config/base_response/result.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/register_repo.dart';
import '../datasources/register_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as:RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  final RegisterDataSource registerDataSource;
  RegisterRepoImpl({required this.registerDataSource});
  @override
  Future<Result<RegisterEntity>> register(RegisterRequestParams params) async {
    final result = await registerDataSource.register(params.toModel());
    return result.when(
      success: (res) => Result.success(res.toEntity()),
      error: (fail) => Result.error(fail),
    );
  }
}