// ignore_for_file: file_names

import 'package:aeroaura/utils/routes_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "AeroAura Forecast",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(
              AeroAuraRoutesNames.addCityPage,
            );
          },
          icon: const Icon(
            CupertinoIcons.plus,
            size: 32,
          )),
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AeroAuraRoutesNames.settingsPage);
            },
            icon: const Icon(
              Icons.settings_rounded,
              size: 32,
            )),
      ],
      systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    );
  }
}
