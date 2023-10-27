import 'package:chatting/Chat/ChatBubble/chatbubble.dart';
import 'package:chatting/Chat/Chatting%20Service/chatservice.dart';
import 'package:chatting/Decider/decider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  final String recieverUserEmail;
  final String recieverUserId;

  const ChatRoom(
      {super.key,
      required this.recieverUserEmail,
      required this.recieverUserId});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //if message text is not empty only hen the message will be sent
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendingmessage(
          widget.recieverUserId, _messageController.text);
      //clear the text field after sending the message for typing the new message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recieverUserEmail),
        centerTitle: true,
        backgroundColor: Color(0xff6796e9),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Messages
            Expanded(
              child: _buildMessageList(),
            ),

            //user input
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.recieverUserId, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //align message on left for reciever and right for sender
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId']==_firebaseAuth.currentUser!.uid)?CrossAxisAlignment.end:CrossAxisAlignment.start,
          mainAxisAlignment: (data['senderId']==_firebaseAuth.currentUser!.uid)?MainAxisAlignment.end:MainAxisAlignment.start,
          children: [
            Text(data['senderEmail']),
            ChatBubble(message:data['message']),
          ],
        ),
      ),
    );
  }

  //build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,0,0,8),
            child: TextField(
              obscureText: true,
              controller: _messageController,
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
        ),

        //send button
        Padding(
          padding: const EdgeInsets.fromLTRB(10,0,8,4),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff6796e9),
            ),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_right_outlined,
                )
            ),
          ),
        )
      ],
    );
  }
}
