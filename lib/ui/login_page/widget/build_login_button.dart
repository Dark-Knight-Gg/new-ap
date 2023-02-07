import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../common/build_widget.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class BuildLoginButton extends StatefulWidget {
  const BuildLoginButton({Key? key}) : super(key: key);

  @override
  State<BuildLoginButton> createState() => _BuildLoginButtonState();
}

class _BuildLoginButtonState extends State<BuildLoginButton> {
  // final bool isActive= false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : CustomButton(
                text: 'Đăng nhập',
                isActive: state.status.isValidated,
                onPressed: state.status.isValidated
                    ? () => context.read<LoginBloc>().add(LoginSubmitted())
                    : null,
              );
      },
    );
  }
}
