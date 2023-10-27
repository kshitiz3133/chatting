import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff6796e9),
      ),
      child: Text(message,style: TextStyle(fontSize: 16),),
    );
  }
}
