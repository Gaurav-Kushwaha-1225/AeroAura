// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SizedBoxInSliver extends StatelessWidget {
  final double height;
  final double width;
  const SizedBoxInSliver(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
