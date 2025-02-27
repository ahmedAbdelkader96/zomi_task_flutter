import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/authentication/bloc/auth_bloc.dart';
import 'package:task/features/authentication/controller/controller.dart';
import 'package:task/features/main_view/bloc/main_view_bloc.dart';
import 'package:task/features/main_view/controller/controller.dart';
import 'package:task/features/menu/bloc/menu_bloc.dart';
import 'package:task/features/menu/controller/controller.dart' as m;

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<AuthenticationBloc>(
        create: (_) => AuthenticationBloc(AuthController())),
    BlocProvider<MainViewBloc>(
        create: (_) => MainViewBloc(MainViewController())),
    BlocProvider<MenuBloc>(create: (_) => MenuBloc(m.MenuController())),
  ];
}
