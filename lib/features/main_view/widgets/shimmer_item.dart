import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerTitle(),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MQuery.getWidth(context, 340),
              height: 250,
              color: Colors.white, // The line color
            ),
          ),
        ),
        SizedBox(height: 10),
        _buildShimmerLine(double.infinity),
        SizedBox(height: 5),
        _buildShimmerLine(double.infinity),
        SizedBox(height: 5),
        _buildShimmerLine(MQuery.getWidth(context, 200)),
      ],
    );
  }

  Widget _buildShimmerTitle() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 40, // Height of the line
        color: Colors.white, // The line color
      ),
    );
  }

  Widget _buildShimmerLine(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: 16, // Height of the line
        color: Colors.white, // The line color
      ),
    );
  }
}
