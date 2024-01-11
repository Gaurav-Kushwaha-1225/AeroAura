import 'package:aeroaura/screens/home/home.dart';
import 'package:aeroaura/screens/next_7_days/next_7_days.dart';
import 'package:aeroaura/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AeroAura());
}

class AeroAura extends StatelessWidget {
  const AeroAura({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AeroTheme.lightTheme,
      darkTheme: AeroTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const NextSevenDays(),
    );
  }
}
