part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();
}

class MenuInitialState extends MenuState {
  @override
  List<Object> get props => [];
}

class LoadingToSignOutState extends MenuState {
  @override
  List<Object> get props => [];
}

class DoneToSignOutState extends MenuState {
  @override
  List<Object> get props => [];
}

class ErrorToSignOutState extends MenuState {
  final String message;

  const ErrorToSignOutState({required this.message});

  @override
  List<Object> get props => [];
}
