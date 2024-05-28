import 'package:aeroaura/screens/settings_page/local_widgets/app_bar.dart';
import 'package:aeroaura/screens/settings_page/local_widgets/setting_tile_1.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 5, top: 15),
                children: const [
                  ThemeTile(),
            ])));
  }
}
