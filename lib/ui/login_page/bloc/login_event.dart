import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserNameChange extends LoginEvent {
  LoginUserNameChange(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class LoginPasswordChange extends LoginEvent {
  LoginPasswordChange(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
class OnClickIconShowPassWord extends LoginEvent{
  OnClickIconShowPassWord();
}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted();
}
