import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../validation/password_validation.dart';
import '../../../validation/user_name_validation.dart';


class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isShowPassWord = true,
  });
  final FormzStatus status;
  final Username username;
  final Password password;
  final bool isShowPassWord;
  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    bool? isShowPassWord,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isShowPassWord: isShowPassWord ?? this.isShowPassWord,
    );
  }

  @override
  List<Object> get props => [status, username, password,isShowPassWord];

}
