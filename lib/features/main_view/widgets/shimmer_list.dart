import 'package:flutter/material.dart';
import 'package:task/features/main_view/widgets/shimmer_item.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ShimmerItem();
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 0.5,
            color: Colors.grey,
            width: MQuery.getWidth(context, 340),
            margin: EdgeInsets.symmetric(vertical: 30),
          );
        },
        itemCount: 10);
  }
}
