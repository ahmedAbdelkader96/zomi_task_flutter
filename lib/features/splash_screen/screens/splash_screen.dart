import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:task/global/methods_helpers_functions/local_storage_helper.dart';
import 'package:task/global/navigation_routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initPage();
  }

  Future<void> initPage() async {
    bool? isAuthenticated =
        await LocalStorageHelper.getBool(key: 'is_authenticated');

    if (isAuthenticated != null) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Routes.mainViewScreen(context: context);
      });
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Routes.authScreen(context: context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Zomi Wealth Task",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
