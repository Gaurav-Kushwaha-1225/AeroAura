// ignore_for_file: non_constant_identifier_names

class Weather {
  final Map<String, dynamic> current;
  final Map<String, dynamic> current_units;
  final Map<String, dynamic> daily;
  final Map<String, dynamic> daily_units;
  final Map<String, dynamic> hourly;
  final Map<String, dynamic> hourly_units;

  Weather(
      {required this.current_units,
      required this.current,
      required this.daily_units,
      required this.daily,
      required this.hourly_units,
      required this.hourly});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        current_units: json['current_units'],
        current: json['current'],
        daily_units: json['daily_units'],
        daily: json['daily'],
        hourly_units: json['hourly_units'],
        hourly: json['hourly']);
  }
}
