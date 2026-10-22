import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/features/register/domain/entities/register_request_params.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';
import '../bloc/register_bloc.dart';

class FirstRegisterForm extends StatefulWidget {
  const FirstRegisterForm({super.key});

  @override
  State<FirstRegisterForm> createState() => _FirstRegisterFormState();
}

class _FirstRegisterFormState extends State<FirstRegisterForm> {
  bool _isInit = true;

  late final RegisterBloc bloc;
  late final AppLocalizations locale;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    bloc = getIt<RegisterBloc>();
    _formKey = GlobalKey<FormState>();
    firstNameController = TextEditingController(
      text: bloc.state.params.firstName,
    );
    lastNameController = TextEditingController(
      text: bloc.state.params.lastName,
    );
    emailController = TextEditingController(
      text: bloc.state.selectedRole == bloc.state.params.role
          ? bloc.state.params.email
          : '',
    );

    nodes = [FocusNode(), FocusNode(), FocusNode()];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isInit = false;
      locale = AppLocalizations.of(context)!;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    for (var node in nodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: firstNameController,
            hint: locale.registerFirstNameHint,
            focusNode: nodes[0],
            keyboardType: .name,
            validator: (value) => AppValidators.validateName(
              value,
              context: context,
              fieldName: locale.registerFirstNameLabel,
            ),
            onSubmitted: (_) {
              if (firstNameController.text.isNotEmpty) {
                nodes[1].requestFocus();
              }
            },
            onChange: (value) {
              bloc.doIntent(
                RegisterUpdateTextFieldsValuesEvent(
                  params: RegisterRequestParams(firstName: value),
                ),
              );
            },
            labelText: locale.registerFirstNameLabel,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: lastNameController,
            hint: locale.registerLastNameHint,
            focusNode: nodes[1],
            keyboardType: .name,
            validator: (value) => AppValidators.validateName(
              value,
              context: context,
              fieldName: locale.registerLastNameLabel,
            ),
            onSubmitted: (_) {
              if (lastNameController.text.isNotEmpty) {
                nodes[2].requestFocus();
              }
            },
            onChange: (value) {
              bloc.doIntent(
                RegisterUpdateTextFieldsValuesEvent(
                  params: RegisterRequestParams(lastName: value),
                ),
              );
            },
            labelText: locale.registerLastNameLabel,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: emailController,
            hint: bloc.state.selectedRole == UserRole.dentist
                ? locale.registerDentistEmailHint
                : locale.registerPatientEmailHint,
            focusNode: nodes[2],
            keyboardType: .emailAddress,
            validator: (value) => AppValidators.validateEmail(value, context: context),
            onSubmitted: (_) {
              if (_formKey.currentState!.validate()) {
                bloc.doIntent(RegisterContinueEvent());
              }
            },
            onChange: (value) {
              bloc.doIntent(
                RegisterUpdateTextFieldsValuesEvent(
                  params: RegisterRequestParams(email: value),
                ),
              );
            },
            labelText: bloc.state.selectedRole == UserRole.dentist
                ? locale.registerDentistEmailLabel
                : locale.registerPatientEmailLabel,
          ),
          const SizedBox(height: 24),
          CustomButton(
            title: locale.continueButton,
            isLoading: false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                bloc.doIntent(RegisterContinueEvent());
              }
            },
          ),
        ],
      ),
    );
  }
}
