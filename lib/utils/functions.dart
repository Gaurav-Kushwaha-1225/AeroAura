// ignore_for_file: non_constant_identifier_names
import 'package:country_state_city/country_state_city.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

String ConvertTimeTo12HrFormat(String dateTimeString) {
  DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm").parse(dateTimeString);
  String formattedTime = DateFormat("h:mm a").format(dateTime);
  return formattedTime;
}
String ConvertTimeTo24HrFormat(String dateTimeString) {
  DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm").parse(dateTimeString);
  final formattedTime = DateFormat.Hm().format(dateTime);
  return formattedTime;
}
String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thu", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'];
}

String formatDate(String date) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final outputFormat = DateFormat('E, dd MMM');
  DateTime dateTime = inputFormat.parse(date);
  String formattedDate = outputFormat.format(dateTime);

  return formattedDate;
}

bool isTomorrow(String inputDateString) {
  DateTime inputDate = DateTime.parse(inputDateString);
  DateTime now = DateTime.now();
  DateTime tomorrow =
      DateTime(now.year, now.month, now.day).add(const Duration(days: 1));

  return inputDate.year == tomorrow.year &&
      inputDate.month == tomorrow.month &&
      inputDate.day == tomorrow.day;
}

String uvComment(double uv_index) {
  if (uv_index < 3) {
    return "Low";
  } else if (uv_index < 6) {
    return "Moderate";
  } else if (uv_index < 8) {
    return "High";
  } else if (uv_index < 11) {
    return "Very High";
  } else {
    return "Extreme";
  }
}

Future<List<City>> getCities() async {
  // Get all cities
  final cities = await getAllCities();

  return cities;
}
