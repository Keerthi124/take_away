
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_away/constants.dart';
import 'package:take_away/widgets/custom_button.dart';
import 'package:take_away/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          width:double.infinity,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                padding: EdgeInsets.only(
                  top:24.0,
                ),
                child:Text("Create New Account",
                  textAlign: TextAlign.center,
                  style:Constants.boldheading,
                ),
              ),
              Column(
                children: [
                  CustomInput (
                    hintText: "Email...",
                  ),
                  CustomInput (
                    hintText: "Password...",
                  ),
                  CustomBtn(
                    text:"Create New Account",
                    onPressed: (){
                      print("Clicked the create New Account");
                    },
                    outlineBtn:false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0
                ),
                child:CustomBtn(
                  text:"Back To Login",
                  onPressed: (){
                      Navigator.pop(context);
                  },
                  outlineBtn:true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
