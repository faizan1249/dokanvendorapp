import 'package:flutter/material.dart';
import 'package:vendor_app/enum/app_status.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  late int statusCode;
  AppStatus _appStatus = AppStatus.IDLE;
  set setAppStatus(AppStatus newAppStatus) {
    _appStatus = newAppStatus;
    notifyListeners();
  }

  AppStatus get getAppStatus => _appStatus;

  set setStatusCode(int newStatusCode) {
    statusCode = newStatusCode;
    notifyListeners();
  }

  int get getStatusCode => statusCode;

  Future checkAuth({showLoading = true}) async {
    if (showLoading) {
      setAppStatus = AppStatus.LOADING;
    }
    try {
      dynamic ApiResponse = await ApiBaseHelper(
        url: "https://bgentlemen.com/wp-json/dokan/v1/settings",
      ).getMethod();
      setAppStatus = AppStatus.IDLE;

      print(ApiResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
