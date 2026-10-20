import 'package:denta/features/register/domain/entities/register_request_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';

part 'register_event.dart';
part 'register_state.dart';

@lazySingleton
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.initial());

  void doIntent() {
    
  }

}
