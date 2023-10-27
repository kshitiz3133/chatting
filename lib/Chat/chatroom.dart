import 'package:chatting/Decider/decider.dart';
import 'package:flutter/material.dart';
class ChatRoom extends StatefulWidget {
  final String recieverUserEmail;
  final String recieverUserId;
  const ChatRoom({super.key,required this.recieverUserEmail,required this.recieverUserId});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){Navigator.push(context,
                    PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { return Decider();}));
                }, icon: Icon(Icons.keyboard_arrow_left)),
                Text(widget.recieverUserEmail),
                SizedBox(height: 20,width: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
