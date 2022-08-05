import 'package:flutter/material.dart';

import 'colors.dart';

class ProjectStrings {
  final String appTitle = "weatergoo";
  final String searchHintText = "  Şehir ara...";
  static String? selectedValue = "konya";

  Text appbarTitle(BuildContext context) {
    return Text(
      ProjectStrings().appTitle,
      style: Theme.of(context).textTheme.headline4?.copyWith(
            color: ProjectColors().brown,
            fontWeight: FontWeight.w600,
          ),
      textAlign: TextAlign.left,
    );
  }
}
