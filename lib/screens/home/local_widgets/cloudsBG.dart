// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../utils/consts.dart';

class CloudBG extends StatefulWidget {
  final int cloudNumber;
  final Size size;
  const CloudBG({Key? key, required this.cloudNumber, required this.size})
      : super(key: key);

  @override
  State<CloudBG> createState() => _CloudBGState();
}

class _CloudBGState extends State<CloudBG> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: widget.size,
        painter: widget.cloudNumber == 1
            ? CloudPainterOne()
            : widget.cloudNumber == 2
                ? CloudPainterTwo()
                : CloudPainterThree());
  }
}

class CloudPainterOne extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Constants.lightSecondary
      ..style = PaintingStyle.fill;

    var cloudPath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.84, size.height * 0.11), radius: 35))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.98, size.height * 0.04), radius: 55))
      ..addRRect(RRect.fromLTRBAndCorners(size.width * 0.76, size.height * 0.09,
          size.width * 1.15, size.height * 0.18,
          bottomLeft: const Radius.circular(30),
          bottomRight: const Radius.circular(30)));

    canvas.drawPath(cloudPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CloudPainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Constants.lightSecondary
      ..style = PaintingStyle.fill;

    var cloudPath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.22, size.height * 0.48), radius: 50))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.03, size.height * 0.38), radius: 60))
      ..addRRect(RRect.fromLTRBAndCorners(size.width * 0, size.height * 0.5,
          size.width * 0.3, size.height * 0.648,
          bottomRight: const Radius.circular(30)));

    canvas.drawPath(cloudPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CloudPainterThree extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Constants.lightSecondary
      ..style = PaintingStyle.fill;

    var cloudPath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.807, size.height * 0.47), radius: 17))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.872, size.height * 0.45), radius: 27))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.952, size.height * 0.465), radius: 19))
      ..addRRect(RRect.fromLTRBAndCorners(size.width * 0.7635,
          size.height * 0.47, size.width, size.height * 0.5051,
          bottomRight: const Radius.circular(19),
          bottomLeft: const Radius.circular(17)));

    canvas.drawPath(cloudPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
