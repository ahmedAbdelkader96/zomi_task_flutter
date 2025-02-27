part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {
  @override
  List<Object> get props => [];
}




class LoadingToSignUpWithEmailAndPasswordState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class ErrorToSignUpWithEmailAndPasswordState extends AuthenticationState {
  final String message;

  const ErrorToSignUpWithEmailAndPasswordState({required this.message});

  @override
  List<Object> get props => [];
}
class DoneToSignUpWithEmailAndPasswordState extends AuthenticationState {

  @override
  List<Object> get props => [];
}



class LoadingToSignInWithEmailAndPasswordState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class DoneToSignInWithEmailAndPasswordState extends AuthenticationState {

  @override
  List<Object> get props => [];
}
class ErrorToSignInWithEmailAndPasswordState extends AuthenticationState {
  final String message;

  const ErrorToSignInWithEmailAndPasswordState({required this.message});

  @override
  List<Object> get props => [];
}



class LoadingToSignWithGoogleState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class ErrorToSignWithGoogleState extends AuthenticationState {
  final String message;

  const ErrorToSignWithGoogleState({required this.message});

  @override
  List<Object> get props => [];
}
class DoneToSignWithGoogleState extends AuthenticationState {

  @override
  List<Object> get props => [];
}


class LoadingToRenewTokenState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class DoneToRenewTokenState extends AuthenticationState {
  final String token;
  final String refreshToken;

  const DoneToRenewTokenState({
    required this.token,required this.refreshToken});
  @override
  List<Object> get props => [];
}
class ErrorToRenewTokenState extends AuthenticationState {
  final String message;

  const ErrorToRenewTokenState({required this.message});

  @override
  List<Object> get props => [];
}










