// ignore_for_file: file_names

import 'dart:convert';

import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/routes_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double? temp;
  final String? wmoCode;
  final String? city;
  final double? uvIndex;
  const CustomAppBar(
      {super.key,
      required this.city,
      required this.temp,
      required this.uvIndex,
      required this.wmoCode});

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
      systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle(
              systemNavigationBarColor: Constants.navigationBarDark,
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarDividerColor:
                  Constants.navigationBarDividerDark,
              statusBarColor: Constants.statusBarDark,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle(
              systemNavigationBarColor: Constants.navigationBarLight,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarDividerColor: Colors.black26,
              statusBarColor: Constants.navigationBarLight,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
      leading: IconButton(
          onPressed: () {
            GoRouter.of(context)
                .pushNamed(AeroAuraRoutesNames.addCityPage, pathParameters: {
              "city": jsonEncode(widget.city),
              "temp": jsonEncode(widget.temp),
              "wmoCode": jsonEncode(widget.wmoCode),
              "uvIndex": jsonEncode(widget.uvIndex)
            });
          },
          icon: const Icon(
            CupertinoIcons.plus,
            size: 24,
          )),
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AeroAuraRoutesNames.settingsPage);
            },
            icon: const Icon(
              Icons.settings_rounded,
              size: 24,
            )),
      ],
    );
  }
}
