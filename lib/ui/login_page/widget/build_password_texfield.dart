import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../common/build_widget.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class BuildPasswordTextField extends StatefulWidget {
  const BuildPasswordTextField({Key? key}) : super(key: key);

  @override
  State<BuildPasswordTextField> createState() => _BuildPasswordTextFieldState();
}

class _BuildPasswordTextFieldState extends State<BuildPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomTextFieldHaveIcon(
          text: 'Nhập mật khẩu...',
          visible: state.isShowPassWord,
          suffixIcon: state.status.isValidated,
          iconOnPressed: () =>
              context.read<LoginBloc>().add(OnClickIconShowPassWord()),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChange(password)),
          errorText: state.password.invalid ? 'invalid password' : null,
        );
      },
    );
  }
}

Widget buildLoginLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
