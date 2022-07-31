import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor_app/componenets/custom_buttom.dart';
import 'package:vendor_app/componenets/full_screen_loader.dart';
import 'package:vendor_app/componenets/text_fields.dart';
import 'package:vendor_app/enum/app_status.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:vendor_app/singleton/singletonConsts.dart';
import 'package:vendor_app/view_model/authviewModel.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/view_model/getCat_view_model.dart';
import 'package:vendor_app/views/add_product_form_view.dart';

class DokanLogin extends StatefulWidget {
  static String id = "/dokanlogin";

  @override
  State<DokanLogin> createState() => _DokanLoginState();
}

class _DokanLoginState extends State<DokanLogin> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetCatViewModel>(context, listen: false).getCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    GetCatViewModel catViewModel =
        Provider.of<GetCatViewModel>(context, listen: false);
    ApiBaseHelper helper = Provider.of<ApiBaseHelper>(context, listen: false);
    AuthViewModel _authmodel =
        Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      body: _authmodel.getAppStatus == AppStatus.LOADING
          ? FullScreenLoader()
          : SingleChildScrollView(
              padding: EdgeInsets.only(top: 170),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Hey, Welcome Back !",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              CustomTextField(
                                txtController: emailController,
                                obsecureVal: false,
                                hintTxt: "example@abc.com",
                                fieldFillColor: Colors.white,
                                prefixIcon: Icons.mail,
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                txtController: passwordController,
                                obsecureVal: true,
                                hintTxt: "●●●●●●●●●",
                                fieldFillColor: Colors.white,
                                prefixIcon: Icons.security,
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          child: CustomButton(
                            buttonClr: Colors.amber,
                            btnText: "Continue",
                            textColor: Colors.white,
                            elevationVal: false,
                            onPressed: () async {
                              String email =
                                  emailController.value.text.toString().trim();
                              String password = passwordController.value.text
                                  .toString()
                                  .trim();

                              await ApiBaseHelper(
                                      url:
                                          "https://bgentlemen.com/wp-json/dokan/v1/settings")
                                  .getAuth(email, password);
                              print("API CALLED");

                              print(Singleton().ApiStatusCode);

                              if (Singleton().ApiStatusCode == 200) {
                                Singleton().username = email;
                                Singleton().password = password;
                                Fluttertoast.showToast(
                                    msg: "User Logged in successfully");

                                Navigator.pushNamed(context, AddProductForm.id);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Invalid username or password");
                              }
                            },
                          ),
                        ),
                        // Text(catViewModel.getcatListData[0]['name'].toString()),
                        // Text(catViewModel.getcatListData[1]['name'].toString()),
                        // Text(catViewModel.getcatListData[2]['name'].toString()),
                        // Text(catViewModel.getcatListData[3]['name'].toString()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
