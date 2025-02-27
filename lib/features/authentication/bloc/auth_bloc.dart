import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task/features/authentication/controller/controller.dart';
import 'package:task/features/authentication/models/user_model.dart';
import 'package:task/global/methods_helpers_functions/exception_handlers.dart';
import 'package:task/global/methods_helpers_functions/local_storage_helper.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthController controller;

  static AuthenticationBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AuthenticationBloc(this.controller) : super(AuthenticationInitialState()) {
    on<SignUpWithEmailAndPassword>((event, emit) async {
      try {
        emit(LoadingToSignUpWithEmailAndPasswordState());

        http.Response res = await controller.signUp(
            email: event.email, password: event.password, name: event.name);
        var data = jsonDecode(res.body);

        if (res.statusCode == 200) {
          UserModel userModel = UserModel.fromJson(data['user']);
          String token = data['token'];
          String refreshToken = data['refreshToken'];
          await LocalStorageHelper.saveUserMainData(
              userId: userModel.id.toString(),
              token: token,
              refreshToken: refreshToken);

          emit(DoneToSignUpWithEmailAndPasswordState());
        } else {
          String error = data['message'];
          emit(ErrorToSignUpWithEmailAndPasswordState(message: error));
        }
      } catch (error) {
        String message = ExceptionHandlers.handlePlatformError(error: error);
        emit(ErrorToSignUpWithEmailAndPasswordState(message: message));
      }
    });

    on<SignInWithEmailAndPassword>((event, emit) async {
      try {
        emit(LoadingToSignInWithEmailAndPasswordState());

        http.Response res = await controller.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        var data = jsonDecode(res.body);

        if (res.statusCode == 200) {
          UserModel userModel = UserModel.fromJson(data['user']);
          String token = data['token'];
          String refreshToken = data['refreshToken'];

          await LocalStorageHelper.saveUserMainData(
              userId: userModel.id.toString(),
              token: token,
              refreshToken: refreshToken);

          emit(DoneToSignInWithEmailAndPasswordState());
        } else {
          String error = data['message'];
          emit(ErrorToSignInWithEmailAndPasswordState(message: error));
        }
      } catch (error) {
        String message = ExceptionHandlers.handlePlatformError(error: error);
        emit(ErrorToSignInWithEmailAndPasswordState(message: message));
      }
    });

    on<SignWithGoogle>((event, emit) async {
      try {
        emit(LoadingToSignWithGoogleState());

        http.Response res = await controller.signWithGoogle();

        var data = jsonDecode(res.body);

        if (res.statusCode == 200) {
          UserModel userModel = UserModel.fromJson(data['user']);
          String token = data['token'];
          String refreshToken = data['refreshToken'];

          await LocalStorageHelper.saveUserMainData(
              userId: userModel.id.toString(),
              token: token,
              refreshToken: refreshToken);

          emit(DoneToSignWithGoogleState());
        } else {
          String error = data['message'];
          emit(ErrorToSignWithGoogleState(message: error));
        }

        emit(DoneToSignWithGoogleState());
      } catch (error) {
        String message = ExceptionHandlers.handlePlatformError(error: error);
        emit(ErrorToSignWithGoogleState(message: message));
      }
    });

    on<RenewToken>((event, emit) async {
      try {
        emit(LoadingToRenewTokenState());

        http.Response res =
            await controller.renewToken(refreshToken: event.refreshToken);
        var data = jsonDecode(res.body);

        if (res.statusCode == 200) {
          String token = data['token'];
          String refreshToken = data['refreshToken'];
          emit(DoneToRenewTokenState(token: token, refreshToken: refreshToken));
        } else {
          String error = data['message'];
          emit(ErrorToRenewTokenState(message: error));
        }
      } catch (error) {
        String message = ExceptionHandlers.handlePlatformError(error: error);
        emit(ErrorToRenewTokenState(message: message));
      }
    });
  }
}
