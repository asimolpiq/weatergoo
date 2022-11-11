import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:weatergoo/product/countrys.dart';
import 'package:weatergoo/product/materials.dart';
import 'package:weatergoo/product/icons.dart';
import 'package:weatergoo/product/project_dio.dart';
import 'package:weatergoo/service/model/weater_service.dart';

import '../product/colors.dart';
import '../product/padding.dart';
import '../product/strings.dart';
import '../service/model/weater_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with ProjectDioMixin {
  final TextEditingController searchController = TextEditingController();
  late final IWeaterService weaterService;
  List<Result> weathers = [];
  @override
  void initState() {
    super.initState();
    weaterService = WeaterService(service);
    fetch();
  }

  Future<void> fetch({String country = "konya"}) async {
    if (Countrys().countryList.contains(country)) {
      setState(() {});
      weathers = (await weaterService.fetchWeather(country))?.result ?? [];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().toLocal();
    String formattedDate = DateFormat('dd.MM.yyyy').format(now);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ProjectMaterials().customSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(flex: 2, child: ProjectIcons().appIconSVG),
                  Expanded(
                      flex: 3, child: ProjectStrings().appbarTitle(context))
                ],
              ),
              ProjectMaterials().customSpace(),
              SearchField(
                suggestions: Countrys().countryList,
                searchInputDecoration:
                    ProjectMaterials().searchDecoration(searchController),
                controller: searchController,
                onTap: (value) {
                  if (value != null) {
                    setState(() {
                      ProjectStrings.selectedValue = value;
                      setState(() {
                        fetch(country: value);
                      });
                    });
                  }
                },
              ),
              ProjectMaterials().customSpace(),
              Container(
                padding: ProjectPaddings().midPadding,
                height: 90,
                decoration: BoxDecoration(
                    color: ProjectColors().coffee,
                    borderRadius: ProjectPaddings().radius20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              ProjectIcons().locationnSVG,
                              Text(
                                  ProjectStrings.selectedValue?.toUpperCase() ??
                                      "")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              ProjectIcons().calendar,
                              Text(formattedDate)
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Row(children: [
                                  ProjectIcons().thermometer,
                                  Text(weathers.isNotEmpty
                                      ? "${weathers.elementAt(0).degree}  °C"
                                      : "0 °C")
                                ])
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProjectIcons().about,
                                Text(weathers.isNotEmpty
                                    ? "${weathers.elementAt(0).description}"
                                    : "Açık")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ProjectMaterials().customSpace(),
              Container(
                padding: ProjectPaddings().boxPadding,
                height: 300,
                decoration: BoxDecoration(
                    color: ProjectColors().coffee,
                    borderRadius: ProjectPaddings().radius20),
                child: Padding(
                  padding: ProjectPaddings().midPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Günler',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.transparent, // Step 2 SEE HERE
                                shadows: [
                                  Shadow(
                                      offset: Offset(0, -10),
                                      color: Colors.black)
                                ], // Step 3 SEE HERE
                                decoration: TextDecoration.underline,
                                decorationThickness: 5,
                                decorationColor: ProjectColors().brown,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Durum',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.transparent, // Step 2 SEE HERE
                                shadows: [
                                  Shadow(
                                      offset: Offset(0, -10),
                                      color: Colors.black)
                                ], // Step 3 SEE HERE
                                decoration: TextDecoration.underline,
                                decorationThickness: 5,
                                decorationColor: ProjectColors().brown,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Gündüz',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.transparent, // Step 2 SEE HERE
                                shadows: [
                                  Shadow(
                                      offset: Offset(0, -10),
                                      color: Colors.black)
                                ], // Step 3 SEE HERE
                                decoration: TextDecoration.underline,
                                decorationThickness: 5,
                                decorationColor: ProjectColors().brown,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Gece',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.transparent, // Step 2 SEE HERE
                                shadows: [
                                  Shadow(
                                      offset: Offset(0, -10),
                                      color: Colors.black)
                                ], // Step 3 SEE HERE
                                decoration: TextDecoration.underline,
                                decorationThickness: 5,
                                decorationColor: ProjectColors().brown,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: weathers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    weathers[index].day ?? "",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Image.network(
                                    weathers[index].icon ?? "",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    weathers[index].degree ?? "",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    weathers[index].night ?? "",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
