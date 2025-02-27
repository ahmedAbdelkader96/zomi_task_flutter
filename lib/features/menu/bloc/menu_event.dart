part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent extends Equatable {
  const MenuEvent();
}

class SignOut extends MenuEvent {
  @override
  List<Object?> get props => [];
}
