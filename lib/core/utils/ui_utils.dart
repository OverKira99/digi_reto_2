import 'package:flutter/material.dart';

class ScreenSize {
  static double witdh = 0;
  static double height = 0;
  static double absoluteHeight = 0;

  static void setScreenSize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    ScreenSize.witdh = size.width;
    ScreenSize.height = size.height;
    ScreenSize.absoluteHeight = height - MediaQuery.paddingOf(context).top;
  }
}
