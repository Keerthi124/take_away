
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_away/constants.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  CustomInput({this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
          color:Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color:Colors.black,
          width:2.0,
        ),

      ),
      child:TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:hintText?? "Hint Text...",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 18.0,
          )
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
