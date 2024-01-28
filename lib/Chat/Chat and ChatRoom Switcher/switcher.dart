//import 'package:chatting/Chat/Chat%20and%20ChatRoom%20Switcher/demo.dart';
import 'package:chatting/Chat/Users%20List/userslist.dart';
import 'package:chatting/Chat/chatroom.dart';
import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  final _pageController1 = PageController(initialPage: 0);

  bool flag=true;

  @override
  Widget build(BuildContext context) {
    /*return PageView(
      controller: _pageController1,
      children: [
        buildUserList(),
        //ChatRoom(),
      ],
    );*/
    return Scaffold(
      body: flag?buildUserList():Container(child: Text('hi'),),
    );
  }
}
