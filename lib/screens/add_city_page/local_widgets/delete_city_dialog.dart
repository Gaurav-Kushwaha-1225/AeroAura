import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/consts.dart';

class DeleteCityDialog extends StatefulWidget {
  final String city;
  const DeleteCityDialog({super.key, required this.city});

  @override
  State<DeleteCityDialog> createState() => _DeleteCityDialogState();
}

class _DeleteCityDialogState extends State<DeleteCityDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Delete City ${widget.city.split(', ')[0]}",
        overflow: TextOverflow.fade,
        maxLines: 3,
        softWrap: true,
        style: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Constants.darkTabColor
          : Constants.lightTabColor,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close',
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Constants.lightSecondary
                      : Constants.darkSecondary,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis)),
        ),
        TextButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            List<String>? cities = prefs.getStringList('saved_cities');
            cities?.remove(widget.city);
            prefs.setStringList("saved_cities", cities!);
            Navigator.pop(context);
          },
          child: Text('Delete',
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Constants.lightSecondary
                      : Constants.darkSecondary,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis)),
        ),
      ],
    );
  }
}

class GoogleFonts {}
