import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';  

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff6796e9),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 35.0, 0.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 10,),
                  Transform.scale(scale: 0.8,child: Image(image: AssetImage('assets/Icons/home.png'))),
                  SizedBox(width: 20,),
                  Transform.scale(scale: 0.8,child: Image(image: AssetImage('assets/Icons/chat.png'))),
                  SizedBox(width: 30,),
                  Transform.scale(scale: 0.8,
                    child: Image(
                        image: AssetImage('assets/Icons/account.png')),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
            ),
          ),
        ],
      ),
        ),
    );
  }
}
