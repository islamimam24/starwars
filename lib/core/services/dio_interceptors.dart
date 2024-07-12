// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starwars/core/errors/dio_exceptions.dart';
import 'package:starwars/core/errors/exceptions.dart';
import 'package:starwars/core/widgets/error_snackar.dart';
import 'package:starwars/main.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("REQUEST[${options.method}] => PATH: ${options.path}");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );

    // return handler.next(response);
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      List<String> errorStatement = DioExceptions.dioExceptionMessage(err);

      // if (err.response != null) {
      //   if (err.response!.data["error"]["code"] == 429) {
      //     errorSnackBar("Exceeded Limit of ", err.response!.data["error"]["message"]);
      //   }
      // }
      super.onError(err, handler);
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
