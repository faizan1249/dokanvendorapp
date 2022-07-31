import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.prefixIcon,
    required this.hintTxt,
    required this.fieldFillColor,
    required this.obsecureVal,
    this.suffixIcon,
    required this.onChanged,
    required this.txtController,
  });
  String hintTxt;
  final Color fieldFillColor;
  final IconData prefixIcon;
  bool obsecureVal;
  final IconData? suffixIcon;
  final Function(String? val) onChanged;
  TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtController,
      onChanged: onChanged,
      obscureText: obsecureVal,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon),
        prefixIcon: Icon(prefixIcon),
        fillColor: fieldFillColor,
        filled: true,
        border: InputBorder.none,
        hintText: hintTxt,
        contentPadding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}

class ProductFormField extends StatelessWidget {
  ProductFormField({
    required this.prefixText,
    required this.hintTxt,
    required this.txtController,
  });
  String hintTxt;

  final String prefixText;

  TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      controller: txtController,
      decoration: InputDecoration(
        prefixIcon: Text(
          prefixText,
          textAlign: TextAlign.center,
        ),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: hintTxt,
        contentPadding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}
