// ignore_for_file: non_constant_identifier_names

class Weather {
  final Map<String, dynamic> current;
  final Map<String, dynamic> current_units;

  Weather({required this.current_units, required this.current});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        current_units: json['current_units'], current: json['current']);
  }
}
