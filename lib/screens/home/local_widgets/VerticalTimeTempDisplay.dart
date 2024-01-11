// ignore_for_file: file_names, non_constant_identifier_names

import 'package:aeroaura/screens/home/local_widgets/VerticalTimeTempWidget.dart';
import 'package:aeroaura/widgets/SizedBoxInSliver.dart';
import 'package:flutter/material.dart';

class VerticalTimeTempDisplay extends StatefulWidget {
  final Map<String, dynamic> hourly;
  final Map<String, dynamic> hourly_units;
  const VerticalTimeTempDisplay(
      {Key? key, required this.hourly, required this.hourly_units})
      : super(key: key);

  @override
  State<VerticalTimeTempDisplay> createState() =>
      _VerticalTimeTempDisplayState();
}

class _VerticalTimeTempDisplayState extends State<VerticalTimeTempDisplay> {
  // ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   scrollController = ScrollController()
  //     ..addListener(() {
  //       setState(() {});
  //     });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
          shrinkWrap: true,
          primary: false,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return VerticalTimeTempWidget(
                    time: widget.hourly['time'][index],
                    temp: widget.hourly['temperature_2m'][index]
                        .round()
                        .toString(),
                    WMOCode: widget.hourly['weather_code'][index].toString(),
                    isDay: widget.hourly['is_day'][index],
                  );
                },
                childCount: widget.hourly['time'].length,
              ),
            ),
            const SizedBoxInSliver(height: 0, width: 15),
          ],
        ),
      ),
    );
  }
}
