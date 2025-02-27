import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/bloc/main_view_bloc.dart';
import 'package:task/features/main_view/widgets/blogs_widget.dart';
import 'package:task/features/main_view/widgets/bottom_navigation_bar.dart';
import 'package:task/features/menu/widgets/menu_widget.dart';

class MainViewScreen extends StatefulWidget {
  const MainViewScreen({super.key});

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainViewBloc>().add(FetchBlogs(query: '', context: context));
    pageController = PageController(initialPage: 0);
  }

  int selectedIndex = 0;
  late PageController pageController;

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBarWidget(
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              pageController.jumpToPage(index);
            });
          },
          selectedIndex: selectedIndex,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            BlogsWidget(),
            Center(
              child: Text("2"),
            ),
            Center(
              child: Text("3"),
            ),
            MenuWidget(),
          ],
        ));
  }
}
