import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/features/main_view/models/blog_model.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          blog.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: MQuery.getWidth(context, 340),
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: blog.image,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white, // The line color
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          blog.description,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ],
    );
  }
}
