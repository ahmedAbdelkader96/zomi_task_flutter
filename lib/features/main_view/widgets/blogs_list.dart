import 'package:flutter/material.dart';
import 'package:task/features/main_view/models/blog_model.dart';
import 'package:task/features/main_view/widgets/blog_item.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class BlogsList extends StatelessWidget {
  const BlogsList({super.key, required this.blogs});

  final List<BlogModel> blogs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return BlogItem(blog: blogs[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 0.5,
            color: Colors.grey,
            width: MQuery.getWidth(context, 340),
            margin: EdgeInsets.symmetric(vertical: 30),
          );
        },
        itemCount: blogs.length);
  }
}
