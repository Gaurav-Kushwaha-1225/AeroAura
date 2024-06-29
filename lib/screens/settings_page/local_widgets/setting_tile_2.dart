import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/consts.dart';
import '../provider/settings_provider.dart';

class TimeFormatTile extends StatefulWidget {
  const TimeFormatTile({super.key});

  @override
  State<TimeFormatTile> createState() => _TimeFormatTileState();
}

class _TimeFormatTileState extends State<TimeFormatTile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
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
          const Text("Time Format",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          const Expanded(child: SizedBox()),
          DropdownButton(
              items: const [
                DropdownMenuItem(value: false, child: Text("12 Hr Format")),
                DropdownMenuItem(value: true, child: Text("24 Hr Format"))
              ],
              value: provider.is24HrFormat,
              onChanged: (value) => provider.changeTimeFormat())
        ],
      ),
    );
  }
}
