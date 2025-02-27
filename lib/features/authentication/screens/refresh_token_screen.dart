import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/authentication/bloc/auth_bloc.dart';
import 'package:task/global/methods_helpers_functions/local_storage_helper.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';
import 'package:task/global/navigation_routes/routes.dart';

class RefreshTokenScreen extends StatefulWidget {
  const RefreshTokenScreen({super.key, required this.refreshToken});

  final String refreshToken;

  @override
  State<RefreshTokenScreen> createState() => _RefreshTokenScreenState();
}

class _RefreshTokenScreenState extends State<RefreshTokenScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<AuthenticationBloc>()
        .add(RenewToken(refreshToken: widget.refreshToken));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is ErrorToRenewTokenState) {
            ToastClass.toast(context: context, data: state.message, seconds: 3);
            log(state.message);
            await LocalStorageHelper.clearUserMainData();
            SchedulerBinding.instance.addPostFrameCallback((e) {
              Routes.authScreen(context: context);
            });
          }

          if (state is DoneToRenewTokenState) {
            await LocalStorageHelper.saveUserTokens(
                token: state.token, refreshToken: state.refreshToken);
            SchedulerBinding.instance.addPostFrameCallback((e) {
              ToastClass.toast(
                  context: context, data: "Verified successfully!", seconds: 3);
              Routes.mainViewScreen(context: context);
            });
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Renew Token",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MQuery.getheight(context, 25),
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
