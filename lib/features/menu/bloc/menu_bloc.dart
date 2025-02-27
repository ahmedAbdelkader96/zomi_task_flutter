import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/menu/controller/controller.dart' as m;
import 'package:task/global/methods_helpers_functions/exception_handlers.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final m.MenuController controller;

  static MenuBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  MenuBloc(this.controller) : super(MenuInitialState()) {
    on<SignOut>((event, emit) async {
      try {
        emit(LoadingToSignOutState());

        await controller.signOut();

        emit(DoneToSignOutState());
      } catch (error) {
        String message = ExceptionHandlers.handlePlatformError(error: error);
        emit(ErrorToSignOutState(message: message));
      }
    });
  }
}
