import 'package:chatting/Authentication/auth.dart';
import 'package:chatting/Login/Animation/LoginRegisterWave%20Animation/wave.dart';
import 'package:chatting/Login/Register%20Page/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController=TextEditingController();

  final passwordController=TextEditingController();

  //Log User In
  void signUserIn()async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      //after creating new user, create a document for new user in collection
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'email': FirebaseAuth.instance.currentUser!.email,
      },SetOptions(merge: true));
      //user added successfully
      print('done');

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyAnimation(),
              SizedBox(height: 15,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text('Login',style: TextStyle(fontSize: 50),),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 4.0, // Increase the outline thickness
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 1.0, // Increase the outline thickness
                      ),
                    ),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 4.0, // Increase the outline thickness
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 1.0, // Increase the outline thickness
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  signUserIn();
                },
                child: Container(
                height: 35,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xff6796e9),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text('Login',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                ),),
              ),
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New user? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { return Register();}));
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(fontSize: 18, color: Color(0xff6796e9)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
