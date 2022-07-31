// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/componenets/custom_buttom.dart';
import 'package:vendor_app/componenets/text_fields.dart';
import 'package:vendor_app/helper/api_helper.dart';
import 'package:vendor_app/view_model/add_product_view_model.dart';
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
  var imagePath;
  var CatID;

  TextEditingController productNameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController discountedpriceController = new TextEditingController();
  TextEditingController productdescriptionController =
      new TextEditingController();
  TextEditingController productTagController = new TextEditingController();
  TextEditingController quantityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    GetCatViewModel _catmodel = Provider.of<GetCatViewModel>(context);
    AddProductViewModel _addModel =
        Provider.of<AddProductViewModel>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Add New Products",
      )),
      body: SingleChildScrollView(
        child: Padding(
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
                // RawMaterialButton(
                //   onPressed: () async {
                //     await Provider.of<AddProductViewModel>(context, listen: false)
                //         .getImage(ImageSource.gallery);
                //   },
                //   child: Container(
                //     child: Icon(Icons.camera_alt),
                //     height: size.height * 0.2,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: FileImage(_addModel.getImagePath),
                //             fit: BoxFit.cover)),
                //   ),
                // ),
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
                      prefixText: "Sale",
                      hintTxt: "0.00",
                      txtController: discountedpriceController,
                    )),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: ProductFormField(
                      prefixText: "Quantity",
                      hintTxt: "0.00",
                      txtController: quantityController,
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
                          CatID = value['id'];
                        });
                      }),
                ),
                CustomTextField(
                    prefixIcon: Icons.description,
                    hintTxt: "Product Description",
                    fieldFillColor: Colors.white,
                    obsecureVal: false,
                    onChanged: (value) {},
                    txtController: productdescriptionController),
                CustomTextField(
                    prefixIcon: Icons.tag,
                    hintTxt: "Product Tag",
                    fieldFillColor: Colors.white,
                    obsecureVal: false,
                    onChanged: (value) {},
                    txtController: productTagController),
                CustomButton(
                    buttonClr: Colors.amber,
                    btnText: "Add Product",
                    textColor: Colors.black,
                    elevationVal: false,
                    onPressed: () {
                      String productName =
                          productNameController.value.text.toString();
                      String productPrice =
                          priceController.value.text.toString();
                      String discountedPrice =
                          discountedpriceController.value.text.toString();
                      String description =
                          productdescriptionController.value.text.toString();
                      String producttags =
                          productTagController.value.text.toString();

                      int quantity = int.parse(quantityController.value.text);

                      Provider.of<AddProductViewModel>(context, listen: false)
                          .AddProduct(
                        productName,
                        productPrice,
                        discountedPrice,
                        CatID,
                        description,
                        producttags,
                        quantity,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
