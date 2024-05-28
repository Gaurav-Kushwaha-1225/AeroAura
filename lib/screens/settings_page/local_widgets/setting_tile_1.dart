import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/consts.dart';
import '../provider/theme_provider.dart';

class ThemeTile extends StatefulWidget {
  const ThemeTile({super.key});

  @override
  State<ThemeTile> createState() => _ThemeTileState();
}

class _ThemeTileState extends State<ThemeTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Constants.darkTabColor
              : Constants.lightTabColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white12
                  : Colors.black12,
              width: 1.5,
              style: BorderStyle.solid),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text("Dark Theme",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme()),
            )
          ],
        ),
      );
    });
  }
}
