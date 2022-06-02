import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/logito.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon, color: Colors.deepOrange[300]),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context)!;
            switcher.changeTheme(theme: theme);
          },
        ),
      ),
    ],
  );
}
