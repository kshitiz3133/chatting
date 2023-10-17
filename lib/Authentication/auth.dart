import 'package:chatting/Login/Animation/Login%20Success%20Circle%20Zoom/circlezoom.dart';
import 'package:chatting/Login/Register%20Page/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //logged in
          if(snapshot.hasData){
            return MyCircularContainer();
          }
          //if not logged in
          else {
            return Register();
          }
        },
      ),
    );
  }
}
