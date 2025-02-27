import 'package:flutter/material.dart';
import 'package:task/features/authentication/widgets/sign_in_email_pass_widget.dart';
import 'package:task/features/authentication/widgets/sign_up_email_pass_widget.dart';
import 'package:task/features/authentication/widgets/sign_with_google_button.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.only(top: MQuery.getheight(context, 35)),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: MQuery.getWidth(context, 24),
              right: MQuery.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MQuery.getheight(context, 50),
              ),
              AnimatedCrossFade(
                  crossFadeState: crossFadeState,
                  duration: const Duration(milliseconds: 150),
                  reverseDuration: const Duration(milliseconds: 150),
                  firstCurve: Curves.linear,
                  secondCurve: Curves.linear,
                  sizeCurve: Curves.linear,
                  firstChild: const SignInEmailPassWidget(),
                  secondChild: const SignUpEmailPassWidget()),
              SizedBox(
                height: MQuery.getheight(context, 24),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Or login with account",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF96A0B5)),
                  ),
                ],
              ),
              SizedBox(
                height: MQuery.getheight(context, 24),
              ),
              const SignWithGoogleButton(),
              SizedBox(
                height: MQuery.getheight(context, 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    crossFadeState.index == 0
                        ? "Dont’t have an account?"
                        : "Already have account",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF96A0B5)),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        shadowColor: const Color(0xFF017AFE),
                      ),
                      onPressed: () {
                        setState(() {
                          if (crossFadeState.index == 0) {
                            crossFadeState = CrossFadeState.showSecond;
                          } else {
                            crossFadeState = CrossFadeState.showFirst;
                          }
                        });
                      },
                      child: Text(
                        crossFadeState.index == 0 ? "Register Here" : "LogIn",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191D2B)),
                      )),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
