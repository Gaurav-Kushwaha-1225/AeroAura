import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    this.opacity = 0.5,
    this.dismissibles = false,
    this.color = Colors.black,
  }) : super(key: key);

  final double opacity;
  final bool dismissibles;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: dismissibles, color: color),
        ),
        const Center(
            child: CircularProgressIndicator(
          color: Colors.lightBlueAccent,
        )),
      ],
    );
  }
}
