import 'package:flutter/material.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:vendor_app/view_model/add_product_view_model.dart';
import 'package:vendor_app/view_model/authviewModel.dart';
import 'package:vendor_app/views/add_product_form_view.dart';
import 'view_model/getCat_view_model.dart';
import 'views/login_dokan_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) {
            return AuthViewModel();
          },
        ),
        ChangeNotifierProvider<GetCatViewModel>(
          create: (context) {
            return GetCatViewModel();
          },
        ),
        ChangeNotifierProvider<AddProductViewModel>(
          create: (context) {
            return AddProductViewModel();
          },
        ),
        ChangeNotifierProvider<ApiBaseHelper>(create: (context) {
          return ApiBaseHelper(url: "");
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          initialRoute: DokanLogin.id,
          routes: {
            DokanLogin.id: (context) => DokanLogin(),
            AddProductForm.id: (context) => AddProductForm(),
          },
        );
      },
    );
  }
}
