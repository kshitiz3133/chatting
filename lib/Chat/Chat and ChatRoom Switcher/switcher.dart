import 'package:chatting/Chat/Users%20List/userslist.dart';
import 'package:chatting/Chat/chatroom.dart';
import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  final _pageController1 = PageController(initialPage: 0);

  int a = 0;

  void check() {
    if (a == 1) {
      updater();
    }
  }

  void updater() {
    _pageController1.animateToPage(
      1,
      duration: Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController1,
      children: [
        buildUserList(),
        ChatRoom(),
      ],
    );
  }
}
