import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/build_widget.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class BuildUserNameTextField extends StatefulWidget {

  const BuildUserNameTextField({Key? key})
      : super(key: key);

  @override
  State<BuildUserNameTextField> createState() => _BuildUserNameTextFieldState();
}

class _BuildUserNameTextFieldState extends State<BuildUserNameTextField> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomTextFieldHaveIcon(
          text: 'Nhập tên đăng nhập...',
          visible: false,
          suffixIcon: false,
          iconOnPressed: null,
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUserNameChange(username)),
          errorText: state.username.invalid ? 'invalid username' : null,
        );
      },
    );
  }
}