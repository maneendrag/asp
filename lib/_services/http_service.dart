import 'package:asp_base/_app/app.locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'connectivity_service.dart';

class ApiService{

  final ConnectivityService _connection = locator<ConnectivityService>();
  final SnackbarService snackbarService = locator<SnackbarService>();

  //<<==========================Call An API===========================>>
  //====================================================================
  static BaseOptions options = BaseOptions(
    baseUrl: "https://fakestoreapi.com",
    connectTimeout: 30000,
    receiveTimeout: 10000,
  );

  Dio _dio = Dio(options);

  Future get(url, {headers, showLoading = true}) async {
    print("Entered GEt call");
    var result;
    // if (showLoading) _utils.showLoadingDialog();
    if (showLoading) CircularProgressIndicator(color: Colors.orange,);
    try {
      result = await _get(
        url,
        options: Options(headers: headers ?? {}),
      );
      if (showLoading) const CircularProgressIndicator(color: Colors.orange,);
      if (result.statusCode! >= 200 || result.statusCode! < 299) {
        return Map<String, dynamic>.from(result.data);
      }
      snackbarService.showSnackbar(message: result.data["message"].toString());
      return null;
    } catch (e, s) {
      print("$e, $s");
      if (showLoading) const CircularProgressIndicator(color: Colors.orange,);
      return null;
    }
  }
}