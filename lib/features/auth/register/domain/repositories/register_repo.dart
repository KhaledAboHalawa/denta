import 'package:denta/features/auth/register/domain/entities/register_request_params.dart';

import '../../../../../core/config/base_response/result.dart';
import '../../domain/entities/register_entity.dart';

abstract class RegisterRepo {
  Future<Result<RegisterEntity>> register(RegisterRequestParams params);
}
