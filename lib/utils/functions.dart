// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

String ConvertTimeTo12HrFormat(String dateTimeString) {
    DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm").parse(dateTimeString);
    String formattedTime = DateFormat("h:mm a").format(dateTime);
    return formattedTime;
  }