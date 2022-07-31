import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:vendor_app/models/add_new_product_model.dart';
import 'dart:io';

import 'package:vendor_app/singleton/singletonConsts.dart';

class AddProductViewModel with ChangeNotifier {
  ImagePicker picker = ImagePicker();

  var _image;
  var imagePicker;
  var type;

  late String status;
  set setStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }

  set setImagePath(dynamic newImagePath) {
    _image = newImagePath;
    notifyListeners();
  }

  dynamic get getImagePath => _image;

  String get getStatus => status;

  Future<dynamic> getImage(ImageSource source) async {
    XFile? image = await picker.pickImage(source: source, imageQuality: 50);
    _image = File(image!.path);

    setImagePath = _image;
  }

  Future AddProduct(String productName, String price, String discount,
      int catID, String productDescription, String productTag, int quantity,
      {showLoading = true}) async {
    print("Calling Api");
    Map<String, dynamic> body = {
      "name": productName,
      "type": "simple",
      "regular_price": price,
      "sale_price": discount,
      "description": productDescription,
      "short_description": "",
      "manage_stock": true,
      "stock_quantity": quantity,
      "categories": [
        {"id": catID}
      ],
      "images": [
        {"src": getImagePath, "position": 0}
      ]
    };
    dynamic ApiResponse = await ApiBaseHelper(
      url: "https://bgentlemen.com/wp-json/dokan/v1/products/",
    ).postMethod(body: body);
    if (Singleton().ApiStatusCode == 200) {
      Fluttertoast.showToast(msg: "Product Added successfully");
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    // AddNewProductModel _addmodel = new AddNewProductModel.fromJson(ApiResponse);

    print(ApiResponse);
  }
}
