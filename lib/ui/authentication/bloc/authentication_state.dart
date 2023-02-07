import 'package:equatable/equatable.dart';
import 'package:vti_express/models/user.dart';
import 'package:vti_express/repository/authentication_repository.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknown() : this();

  const AuthenticationState.authenticated()
      : this(status: AuthenticationStatus.authenticated);

  const AuthenticationState.unauthenticated()
      : this(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.loginFail()
      : this(status: AuthenticationStatus.loginFail);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object?> get props => [status, user];
}
