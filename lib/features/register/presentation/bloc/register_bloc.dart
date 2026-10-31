import 'package:denta/features/register/domain/entities/register_request_params.dart';
import 'package:denta/features/register/domain/usecases/register_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';

part 'register_event.dart';
part 'register_state.dart';

@lazySingleton
class RegisterBloc extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase) : super(const RegisterState.initial());

  void doIntent(RegisterEvent event) {
    event.when(
      submit: _submit,
      back: _back,
      continueRegister: _continueRegister,
      setRole: _setRole,
      updateTextFieldsValues: _updateTextFieldsValues,
    );
  }

  void _continueRegister() {
    emit(
      state.copyWith(
        params: state.params.copyWith(role: state.selectedRole),
        registerPageIndex: state.registerPageIndex + 1,
      ),
    );
  }

  void _submit(RegisterRequestParams params) async {
    emit(
      state.copyWith(
        params: state.params.copyWith(
          password: params.password,
          confirmPassword: params.confirmPassword,
        ),
        response: const BaseState.loading(),
      ),
    );
    final result = await registerUseCase(params);
    result.when(
      success: (res) {
        emit(state.copyWith(response: const BaseState.success(true)));
      },
      error: (fail) {
        emit(state.copyWith(response: BaseState.error(fail.message)));
      },
    );
  }

  void _back() {
    if (state.registerPageIndex > 0) {
      emit(state.copyWith(registerPageIndex: state.registerPageIndex - 1));
    }
  }

  void _updateTextFieldsValues(RegisterRequestParams params) {
    emit(
      state.copyWith(
        params: state.params.copyWith(
          role: state.selectedRole,
          firstName: params.firstName.isNotEmpty ? params.firstName : null,
          lastName: params.lastName.isNotEmpty ? params.lastName : null,
          email: params.email.isNotEmpty ? params.email : null,
          password: params.password.isNotEmpty ? params.password : null,
          confirmPassword: params.confirmPassword.isNotEmpty
              ? params.confirmPassword
              : null,
        ),
      ),
    );
  }

  void _setRole(UserRole role) {
    emit(state.copyWith(selectedRole: role));
  }
}
