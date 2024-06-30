import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/consts.dart';
import '../provider/settings_provider.dart';

class TemperatureTile extends StatefulWidget {
  const TemperatureTile({super.key});

  @override
  State<TemperatureTile> createState() => _TemperatureTileState();
}

class _TemperatureTileState extends State<TemperatureTile> {
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
          const Text("Temperature",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          const Expanded(child: SizedBox()),
          DropdownButton(
              items: const [
                DropdownMenuItem(value: true, child: Text("Celsius (°C)")),
                DropdownMenuItem(value: false, child: Text("Fahrenheit (°F)"))
              ],
              value: provider.isDegreeCelcius,
              onChanged: (value) => provider.changeTemperatureUnit())
        ],
      ),
    );
  }
}
