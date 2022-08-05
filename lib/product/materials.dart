import 'package:flutter/material.dart';
import 'package:weatergoo/product/countrys.dart';
import 'package:weatergoo/product/icons.dart';
import 'package:weatergoo/product/padding.dart';
import 'package:weatergoo/product/strings.dart';
import 'package:weatergoo/screens/main_screen.dart';

import 'colors.dart';

class ProjectMaterials {
  InputDecoration searchDecoration(TextEditingController controller) {
    return InputDecoration(
        filled: true,
        fillColor: ProjectColors().coffee,
        hintText: ProjectStrings().searchHintText,
        contentPadding: ProjectPaddings().minPadding,
        hoverColor: ProjectColors().coffee,
        focusColor: ProjectColors().coffee,
        suffixIcon: InkWell(
          child: searchIcon(),
          onTap: () {
            if (Countrys().countryList.contains(controller.text)) ProjectStrings.selectedValue = controller.text;
          },
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: ProjectPaddings().radius20,
            borderSide: BorderSide(color: ProjectColors().coffee ?? Colors.black)),
        border: OutlineInputBorder(
          borderRadius: ProjectPaddings().radius20,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: ProjectPaddings().radius20,
            borderSide: BorderSide(color: ProjectColors().coffee ?? Colors.black)));
  }

  Container searchIcon() {
    return Container(
      child: Padding(padding: EdgeInsets.all(8), child: ProjectIcons().searchIconSVG),
      decoration: BoxDecoration(color: ProjectColors().brown, borderRadius: ProjectPaddings().radius20),
    );
  }

  SizedBox customSpace() {
    return const SizedBox(
      height: 40,
    );
  }
}
