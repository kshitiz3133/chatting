import 'package:chatting/Account/account.dart';
import 'package:chatting/Chat/chat.dart';
import 'package:chatting/HomeScreen/homescreen.dart';
import 'package:chatting/Home/home.dart';
import 'package:flutter/material.dart';

class Decider extends StatefulWidget {
  @override
  State<Decider> createState() => _DeciderState();
}

class _DeciderState extends State<Decider> with TickerProviderStateMixin{
  final _pageController = PageController(initialPage: 0);
  late AnimationController _controller;
  late Animation<double> _opacity;
  int a = 0;
  double b = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400))..forward();
    _opacity=Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  //checking for pagechange
  void _check() {
    if (a == 0) {
      setState(() {
        b = -1;
      });
    } else if (a == 1) {
      setState(() {
        b = 0;
      });
    } else {
      setState(() {
        b = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
    },
      child: FadeTransition(
        opacity: _opacity,
        child: Stack(
          children: [
            Home(),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 0, 75, 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: AnimatedContainer(
                        alignment: Alignment(b, 0),
                        duration: Duration(milliseconds: 150),
                        curve: Curves.bounceInOut,
                        child: Transform.rotate(
                            angle: 4,
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Color(0xff6796e9),
                            ))),
                  )
                  //Transform.rotate(angle: 4  ,child: Container(height: 30,width: 30,color: Colors.deepPurple,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Container(
                  height: MediaQuery.of(context).size.height-100,
                  width: MediaQuery.of(context).size.width-20,
                  color: Colors.transparent,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Homea(),
                      Chat(),
                      Account(),
                    ],
                    onPageChanged: (index) {
                      setState(() {
                        a = index;
                      });
                      _check();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 3, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                              print('lol');
                            },
                            child: Container(
                              width: 55,
                              height: 45,
                              color: Colors.transparent,
                            )),
                        GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              width: 65,
                              height: 50,
                              color: Colors.transparent,
                            )),
                        GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              width: 50,
                              height: 45,
                              color: Colors.transparent,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
