import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/cupertino.dart';

class WeatherCardDateDayWidget extends StatelessWidget {
  final String date;
  const WeatherCardDateDayWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(isTomorrow(date) ? "Tomorrow" : "",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(formatDate(date),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500))
            ],
          );
  }
}