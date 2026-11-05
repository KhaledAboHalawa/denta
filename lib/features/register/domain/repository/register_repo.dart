import 'package:denta/features/register/domain/entities/register_request_params.dart';

import '../../../../core/config/base_response/result.dart';
import '../entities/register_entity.dart';

abstract class RegisterRepo {
  Future<Result<RegisterEntity>> register(RegisterRequestParams params);
}
