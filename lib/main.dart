import 'package:aeroaura/utils/routes.dart';
import 'package:aeroaura/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AeroAura());
}

class AeroAura extends StatelessWidget {
  const AeroAura({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: AeroTheme.lightTheme,
      darkTheme: AeroTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AeroAuraRouter().router,
    );
  }
}
