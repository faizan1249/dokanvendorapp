import 'package:flutter/material.dart';
import 'package:vendor_app/componenets/custom_buttom.dart';
import 'package:vendor_app/componenets/text_fields.dart';
import 'package:vendor_app/view_model/authviewModel.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/view_model/getCat_view_model.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                      onPressed: () async {},
                    ),
                  ),
                  // Text(catViewModel.getcatListData[0]['name'].toString()),
                  // Text(catViewModel.getcatListData[1]['name'].toString()),
                  // Text(catViewModel.getcatListData[2]['name'].toString()),
                  // Text(catViewModel.getcatListData[3]['name'].toString()),
                  ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Text(
                          catViewModel.getcatListData[index]['name'].toString(),
                        );
                      }),
                      itemCount: catViewModel.getcatListData.length)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
