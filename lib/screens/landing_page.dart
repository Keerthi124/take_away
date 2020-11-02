import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_away/constants.dart';
import 'package:take_away/screens/home_page.dart';
import 'package:take_away/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error:${snapshot.error}"),
            ),
          );
        }
        //Connection intialized-Firebase is running
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream:FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamsnapshot){
                if (streamsnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error:${streamsnapshot.error}"),
                    ),
                  );
                }
                //con state active-to userlogin
                if (streamsnapshot.connectionState == ConnectionState.active) {
                  //Get the user
                  User _user=streamsnapshot.data;
                  //null-notlogged in
                  if( _user==null) {
                      return LoginPage();
                  } else {
                      //logged in
                    return HomePage();
                    }
                }
                //checking authen state
                return Scaffold(
                  body: Center(
                    child: Text(
                      "Checking Authendication...",
                      style: Constants.regularheading,
                    ),
                  ),
                );

              }
          );
          /*Scaffold(
            body: Center(
              child: Text(
                "Firebase App Initialized",
                style: Constants.regularheading,
              ),
            ),
          );*/
        }
        //Connection to firebase is loading
        return Scaffold(
          body: Center(
            child: Text(
              "Initialization App...",
              style: Constants.regularheading,
            ),
          ),
        );
      },
    );
  }
}
