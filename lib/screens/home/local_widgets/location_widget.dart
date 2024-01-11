import 'package:flutter/cupertino.dart';

class LocationWidget extends StatefulWidget {
  final String city;
  final String country;
  const LocationWidget({super.key, required this.city, required this.country});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.location_solid,
          size: 18,
        ),
        Text(
          " ${widget.city}, ${widget.country}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
