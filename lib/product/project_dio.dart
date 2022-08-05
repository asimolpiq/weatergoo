import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final service = Dio(BaseOptions(
      baseUrl: "https://api.collectapi.com/weather",
      headers: {"authorization": "apikey 751F1idbiVQP7NttCeCzmD:3hxkMBS38KuxZOzX1DsSGh"}));
}
