import 'package:flutter/material.dart';

bool isDarkMode(BuildContext ctx) =>
    MediaQuery.platformBrightnessOf(ctx) == Brightness.dark;
