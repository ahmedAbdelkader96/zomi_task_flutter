import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/features/menu/widgets/general_profile_button.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';
import 'package:task/global/navigation_routes/routes.dart';

import '../bloc/menu_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is ErrorToSignOutState) {
          ToastClass.toast(context: context, data: state.message, seconds: 3);
          debugPrint(state.message);
        }

        if (state is DoneToSignOutState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            Routes.authScreen(context: context);
          });
        }
      },
      builder: (context, state) {
        return GeneralProfileButton(
            onPressed: () {
              context.read<MenuBloc>().add(SignOut());
            },
            title: "LogOut",
            isLoading: state is LoadingToSignOutState,
            child: SvgPicture.asset('assets/images/logout.svg'));
      },
    );
  }
}
