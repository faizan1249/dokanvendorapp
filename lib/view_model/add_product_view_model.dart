import 'package:flutter/material.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:vendor_app/models/add_new_product_model.dart';

class AddProductViewModel with ChangeNotifier {
  late String status;
  set setStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }

  String get getStatus => status;

  Map<String, dynamic> body = {
    "name": "arbad chutiya",
    "type": "simple",
    "regular_price": "299",
    "description":
        "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.",
    "short_description":
        "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
    "categories": [
      {"id": 34}
    ],
    "images": [
      {
        "src":
            "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg",
        "position": 0
      }
    ]
  };

  Future AddProduct({showLoading = true}) async {
    print("Calling Api");
    dynamic ApiResponse = await ApiBaseHelper().postMethod(body: body);
    // AddNewProductModel _addmodel = new AddNewProductModel.fromJson(ApiResponse);

    print(ApiResponse);
  }
}
