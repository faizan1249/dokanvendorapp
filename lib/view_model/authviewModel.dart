import 'package:flutter/material.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  Future checkAuth() async {
    dynamic ApiResponse = await ApiBaseHelper().getMethod();
  }
}
