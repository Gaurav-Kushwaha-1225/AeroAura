class Weather {
  final String city;
  final double temperature;

  Weather({required this.city, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
