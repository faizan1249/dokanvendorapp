// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/componenets/text_fields.dart';
import 'package:vendor_app/view_model/getCat_view_model.dart';

class AddProductForm extends StatefulWidget {
  static String id = '/add_product';
  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("Categories Calling");
      Provider.of<GetCatViewModel>(context, listen: false).getCategory();
      print("Categories Called");
    });
  }

  var dropDownVValue = "";

  TextEditingController productNameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController discountedpriceController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    GetCatViewModel _catmodel = Provider.of<GetCatViewModel>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Add New Products",
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Image of Product",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Icon(Icons.camera_alt),
                height: size.height * 0.2,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/no-image.png',
                ))),
              ),
              CustomTextField(
                  prefixIcon: Icons.shopping_bag_outlined,
                  hintTxt: "Product Name",
                  fieldFillColor: Colors.white,
                  obsecureVal: false,
                  onChanged: (value) {},
                  txtController: productNameController),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Price:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: ProductFormField(
                    prefixText: "Rs",
                    hintTxt: "0.00",
                    txtController: priceController,
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: ProductFormField(
                    prefixText: "Rs (discounted)",
                    hintTxt: "0.00",
                    txtController: discountedpriceController,
                  )),
                ],
              ),
              Text("Categories"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: DropdownButton(
                    items: _catmodel.getcatListData
                        .map<DropdownMenuItem<dynamic>>((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items['name'].toString()),
                      );
                    }).toList(),
                    onChanged: (dynamic? value) {
                      setState(() {
                        print(value['name']);
                        print(value['id']);
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
