// ignore_for_file: non_constant_identifier_names

class Venue {
  final String? country;
  final String? city;

  Venue({required this.city, required this.country});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(city: json['city'], country: json['country']);
  }
}
