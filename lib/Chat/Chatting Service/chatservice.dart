import 'package:chatting/Chat/Chatting%20Service/Model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Send Message
  Future<void> sendingmessage(String recieverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      recieverId: recieverId,
      timestamp: timestamp,
      message: message,
    );

    //construct chatroomid and reciever id
    List<String> ids = [currentUserId, recieverId];
    ids.sort(); //sort ids(to ensure the ids are same for a sender reciever pair)
    String chatRoomId = ids.join(
        "_"); //concatenate the string to make a chatroomwith a common id for both
    //add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //Get Messages
  Stream<QuerySnapshot> getMessages(
      String userId, String otherUserId) {
    //construct chatroomid from userids(sorted to ensure it matches while sending)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
