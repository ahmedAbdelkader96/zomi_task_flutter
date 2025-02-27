part of 'auth_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class SignUpWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  final String name;

  const SignUpWithEmailAndPassword(
      {required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [];
}

class SignInWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInWithEmailAndPassword(
      {required this.email, required this.password});

  @override
  List<Object?> get props => [];
}

class SignWithGoogle extends AuthenticationEvent {
  final BuildContext context;

  const SignWithGoogle({required this.context});

  @override
  List<Object?> get props => [];
}

class RenewToken extends AuthenticationEvent {
  final String refreshToken;

  const RenewToken({required this.refreshToken});

  @override
  List<Object?> get props => [];
}
