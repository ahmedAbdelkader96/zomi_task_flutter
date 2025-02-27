import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/bloc/main_view_bloc.dart';
import 'package:task/features/main_view/widgets/blogs_list.dart';
import 'package:task/features/main_view/widgets/shimmer_list.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';
import 'package:task/global/widgets/search_text_field.dart';

class BlogsWidget extends StatefulWidget {
  const BlogsWidget({super.key});

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context
          .read<MainViewBloc>()
          .add(FetchBlogs(query: query, context: context));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 18)),
      child: Column(
        children: [
          SizedBox(
            height: MQuery.getheight(context, 50),
          ),
          SearchTextField(
              controller: searchController,
              hintText: "Search by Blog Title ...",
              onChanged: _onSearchChanged),
          SizedBox(
            height: MQuery.getheight(context, 10),
          ),
          Expanded(
              child: BlocConsumer<MainViewBloc, MainViewState>(
            listener: (context, state) async {
              if (state is ErrorToFetchBlogsState) {
                ToastClass.toast(
                    context: context, data: state.message, seconds: 3);
                log(state.message);
              }
            },
            builder: (context, state) {
              if (state is LoadingToFetchBlogsState) {
                return ShimmerList();
              }
              if (state is DoneToFetchBlogsState) {
                return BlogsList(blogs: state.blogs);
              }

              if (state is ErrorToFetchBlogsState) {
                return Center(
                  child: Text(state.message),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ))
        ],
      ),
    );
  }
}
