import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class ProjectIcons {
  Widget appIconSVG = SvgPicture.asset(
    "assets/weather.svg",
    color: ProjectColors().brown,
    semanticsLabel: "App Icon",
    width: 80,
    height: 80,
  );

  Widget splashIcon = SvgPicture.asset(
    "assets/weather.svg",
    color: ProjectColors().white,
    semanticsLabel: "App Icon",
    width: 150,
    height: 150,
  );

  Widget searchIconSVG = SvgPicture.asset(
    "assets/search_in_cloud.svg",
    color: ProjectColors().white,
    semanticsLabel: "Search Icon",
    width: 30,
    height: 30,
  );

  Widget locationnSVG = SvgPicture.asset(
    "assets/address.svg",
    color: ProjectColors().brown,
    semanticsLabel: "Address",
    width: 30,
    height: 30,
  );

  Widget calendar = SvgPicture.asset(
    "assets/calendar.svg",
    color: ProjectColors().brown,
    semanticsLabel: "Address",
    width: 30,
    height: 30,
  );

  Widget thermometer = SvgPicture.asset(
    "assets/thermometer.svg",
    color: ProjectColors().brown,
    semanticsLabel: "Address",
    width: 30,
    height: 30,
  );

  Widget about = SvgPicture.asset(
    "assets/about.svg",
    color: ProjectColors().brown,
    semanticsLabel: "Address",
    width: 30,
    height: 30,
  );
}
