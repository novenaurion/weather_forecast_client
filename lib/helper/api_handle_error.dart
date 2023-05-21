import 'dart:convert';

import 'package:dio/dio.dart';

part 'api_exception.dart';

Future handleError(error, {bool? isFromAuth = false}) {
  if (error is DioError) {
    print("util onError===> ${error}");
    if (error.response?.statusCode == 400) {
      Map<String, dynamic> jsonMap = json.decode(error.response?.data);
      print("util onError===> ${jsonMap.toString()}");
      throw BadRequestException(jsonMap['message']);
    } else if (error.response?.statusCode == 422) {
      Map<String, dynamic> jsonMap = json.decode(error.response?.data);
      print("util onError===> ${jsonMap.toString()}");
      throw InvalidInputException(jsonMap['message']);
    } else if (error.response?.statusCode == 403) {
      Map<String, dynamic> jsonMap = json.decode(error.response?.data);
      return Future.error(jsonMap['data']);
    } else {
      throw InvalidInputException("There is no internet connection");
    }
  } else {
    print("error in else state ${error.toString()}");
    throw FetchDataException("There is no internet connection");
  }
}
