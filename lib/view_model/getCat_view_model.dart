import 'package:flutter/material.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/models/getCategory_model.dart';

class GetCatViewModel with ChangeNotifier {
  late String Catname;
  late int CatID;
  late List<dynamic> _catListData;

  List<dynamic> get getcatListData => _catListData;

  set SetcatListData(List<dynamic> catListData) {
    _catListData = catListData;
    notifyListeners();
  }
  // late CatModel catModel;

  Future<dynamic> getCategory() async {
    dynamic catListData = await ApiBaseHelper().getMethod();
    print(catListData[0]['id']);
    SetcatListData = catListData;
    print(getcatListData[0]['id']);
  }
}
