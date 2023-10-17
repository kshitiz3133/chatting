import 'package:chatting/Chat/Chat%20and%20ChatRoom%20Switcher/switcher.dart';
import 'package:chatting/Chat/Users%20List/userslist.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  'Chat',
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(width: 120,),
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.add)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: MediaQuery.of(context).size.height - 220,
                  width: MediaQuery.of(context).size.width - 10,
                    color: Colors.transparent,
                    child: Switcher()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
