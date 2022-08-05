// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weatergoo/service/model/weater_model.dart';

abstract class IWeaterService {
  IWeaterService(this.dio);
  final Dio dio;
  Future<weatherModel?> fetchWeather(String Country);
}

class WeaterService extends IWeaterService {
  WeaterService(super.dio);

  @override
  Future<weatherModel?> fetchWeather(String country) async {
    final response = await dio.get("/getWeather?data.lang=tr&data.city=$country");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return weatherModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
