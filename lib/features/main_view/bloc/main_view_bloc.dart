import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task/features/main_view/controller/controller.dart';
import 'package:task/features/main_view/models/blog_model.dart';
import 'package:task/global/methods_helpers_functions/exception_handlers.dart';
import 'package:task/global/methods_helpers_functions/local_storage_helper.dart';
import 'package:task/global/navigation_routes/routes.dart';

part 'main_view_event.dart';

part 'main_view_state.dart';

class MainViewBloc extends Bloc<MainViewEvent, MainViewState> {
  final MainViewController controller;

  static MainViewBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  MainViewBloc(this.controller) : super(MainViewInitialState()) {
    on<FetchBlogs>((event, emit) async {
      try {
        emit(LoadingToFetchBlogsState());

        http.Response res = await controller.fetchBlogs(query: event.query);

        if (res.statusCode == 200) {
          List<dynamic> body = json.decode(res.body);
          List<BlogModel> blogs =
              body.map((model) => BlogModel.fromJson(model)).toList();
          emit(DoneToFetchBlogsState(blogs: blogs));
        } else if (res.statusCode == 401) {
          String? refreshToken =
              await LocalStorageHelper.getString(key: 'refresh_token');
          emit(ErrorToFetchBlogsState(message: "Auth Failed!"));
          SchedulerBinding.instance.addPostFrameCallback((e) {
            Routes.refreshTokenScreen(
                context: event.context, refreshToken: refreshToken.toString());
          });
        } else {
          var data = jsonDecode(res.body);
          String error = data['message'];
          emit(ErrorToFetchBlogsState(message: error));
        }
      } catch (error) {
        String message = ExceptionHandlers.handlePlatformError(error: error);
        emit(ErrorToFetchBlogsState(message: message));
      }
    });
  }
}
