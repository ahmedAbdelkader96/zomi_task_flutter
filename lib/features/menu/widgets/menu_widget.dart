import 'package:flutter/material.dart';
import 'package:task/features/menu/widgets/logout_button.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MQuery.getheight(context, 46),
          ),
          const LogoutButton(),


        ],
      ),
    );
  }
}
