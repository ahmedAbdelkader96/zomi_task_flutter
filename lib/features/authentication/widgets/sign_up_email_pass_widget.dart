import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/authentication/bloc/auth_bloc.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';
import 'package:task/global/methods_helpers_functions/local_storage_helper.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';
import 'package:task/global/navigation_routes/routes.dart';
import 'package:task/global/widgets/general_password_text_field_with_floating_label.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';
import 'package:task/global/widgets/general_text_field_with_floating_label.dart';

class SignUpEmailPassWidget extends StatefulWidget {
  const SignUpEmailPassWidget({super.key});

  @override
  State<SignUpEmailPassWidget> createState() => _SignUpEmailPassWidgetState();
}

class _SignUpEmailPassWidgetState extends State<SignUpEmailPassWidget> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF191D2B)),
        ),
        SizedBox(
          height: MQuery.getheight(context, 8),
        ),
        const Text(
          "Create new account",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF96A0B5)),
        ),
        SizedBox(
          height: MQuery.getheight(context, 40),
        ),
        const Text(
          "Username",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF191D2B)),
        ),
        SizedBox(
          height: MQuery.getheight(context, 8),
        ),
        GeneralTextFieldWithFloatingLabel(
          controller: nameController,
          hintText: "Enter name...",
          onChanged: (v) {
            setState(() {});
          },
          validator: (value) {
            return null;
          },
        ),
        SizedBox(
          height: MQuery.getheight(context, 24),
        ),
        const Text(
          "Email",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF191D2B)),
        ),
        SizedBox(
          height: MQuery.getheight(context, 8),
        ),
        GeneralTextFieldWithFloatingLabel(
          controller: emailController,
          hintText: "Enter email...",
          onChanged: (v) {
            setState(() {});
          },
          validator: (value) {
            return null;
          },
        ),
        SizedBox(
          height: MQuery.getheight(context, 24),
        ),
        const Text(
          "Password",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF191D2B)),
        ),
        SizedBox(
          height: MQuery.getheight(context, 8),
        ),
        GeneralPasswordTextFieldWithFloatingLabel(
            controller: passwordController,
            hintText: "Enter password...",
            obscureText: obscureText,
            onChanged: (v) {
              setState(() {});
            },
            changeObsecureValue: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            validator: null),
        SizedBox(
          height: MQuery.getheight(context, 24),
        ),
        BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state)  {
            if (state is ErrorToSignUpWithEmailAndPasswordState) {
              ToastClass.toast(
                  context: context, data: state.message, seconds: 3);
              log(state.message);
            }

            if (state is DoneToSignUpWithEmailAndPasswordState) {
              ToastClass.toast(
                  context: context,
                  data: "Account created successfully!",
                  seconds: 3);

              Routes.mainViewScreen(context: context);
            }
          },
          builder: (context, state) {
            return GeneralRawMaterialButton(
                onPressed: () {
                  if (state is LoadingToSignUpWithEmailAndPasswordState) {
                  } else {
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (name.isEmpty) {
                      ToastClass.toast(
                          context: context,
                          data: "Name should be provided!",
                          seconds: 3);
                    } else if (!Constants.emailRegExp.hasMatch(email)) {
                      ToastClass.toast(
                          context: context,
                          data: "Please enter valid email",
                          seconds: 3);
                    } else if (password.length < 6) {
                      ToastClass.toast(
                          context: context,
                          data: "Password length should be 6 or more",
                          seconds: 3);
                    } else {
                      context.read<AuthenticationBloc>().add(
                          SignUpWithEmailAndPassword(
                              name: name, email: email, password: password));
                    }
                  }
                },
                height: 56,
                width: MQuery.getWidth(context, 328),
                backColor: nameController.text.trim().isNotEmpty &&
                        emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty
                    ? const Color(0xFF191D2B)
                    : const Color(0xFFD0D5DC),
                borderSideWidth: 0,
                borderSideColor: Colors.transparent,
                radius: MQuery.getheight(context, 10),
                child: state is LoadingToSignUpWithEmailAndPasswordState
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)),
                      ));
          },
        )
      ],
    );
  }
}
