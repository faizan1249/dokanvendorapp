import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonClr;
  String btnText;
  final Color textColor;
  bool elevationVal;
  Function() onPressed;
  IconData? btnIcon;

  CustomButton({
    required this.buttonClr,
    required this.btnText,
    required this.textColor,
    required this.elevationVal,
    required this.onPressed,
    this.btnIcon,
  });
  bool isAttention = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevationVal
          ? BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 0.2,
                  offset: Offset(0, 10),
                ),
              ],
            )
          : BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.white.withOpacity(0),
                  blurRadius: 0,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
      child: RaisedButton(
          color: buttonClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          splashColor: Colors.amber,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              btnText,
              style: TextStyle(fontSize: 17, color: textColor),
            ),
          )),
    );
  }
}

//------------------------------------------------------------------------------------

class LoginLogoButton extends StatelessWidget {
  final Color buttonClr;
  String btnText;
  final Color textColor;

  Function() onPressed;
  String imagePath;
  bool borderVal;
  LoginLogoButton({
    required this.buttonClr,
    required this.btnText,
    required this.textColor,
    required this.onPressed,
    required this.imagePath,
    required this.borderVal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderVal
          ? BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10.0))
          : BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
      child: RaisedButton(
        color: buttonClr,
        elevation: 0,
        splashColor: Colors.transparent,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    imagePath,
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    btnText,
                    style: TextStyle(fontSize: 18, color: textColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomOrderButton extends StatelessWidget {
  final Color buttonClr;
  String btnText;
  final Color textColor;
  bool elevationVal;
  Function() onPressed;
  IconData? btnIcon;

  CustomOrderButton({
    required this.buttonClr,
    required this.btnText,
    required this.textColor,
    required this.elevationVal,
    required this.onPressed,
    this.btnIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevationVal
          ? BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 0.2,
                  offset: Offset(0, 10),
                ),
              ],
            )
          : BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.white.withOpacity(0),
                  blurRadius: 0,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
      child: RaisedButton(
          elevation: 0,
          splashColor: Colors.amber,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          color: buttonClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
            child: Text(
              btnText,
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          )),
    );
  }
}
