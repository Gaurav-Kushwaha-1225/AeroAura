// ignore_for_file: file_names

import 'package:aeroaura/utils/consts.dart';
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
        "Add City",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 24,
          )),
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
    );
  }
}
