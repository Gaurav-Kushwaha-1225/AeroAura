// ignore_for_file: file_names

import 'package:aeroaura/screens/home/local_widgets/VerticalTimeTempWidget.dart';
import 'package:flutter/material.dart';

class VerticalTimeTempDisplay extends StatefulWidget {
  const VerticalTimeTempDisplay({Key? key}) : super(key: key);

  @override
  State<VerticalTimeTempDisplay> createState() =>
      _VerticalTimeTempDisplayState();
}

class _VerticalTimeTempDisplayState extends State<VerticalTimeTempDisplay> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // color: Colors.red,
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.05)],
            stops: const [0.9, 1],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const VerticalTimeTempWidget();
                },
                childCount: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
