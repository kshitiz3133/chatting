import 'package:chatting/Chat/Chat%20and%20ChatRoom%20Switcher/switcher.dart';
import 'package:chatting/Chat/chat.dart';
import 'package:chatting/Chat/chatroom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class buildUserList extends StatefulWidget {
  @override
  State<buildUserList> createState() => _buildUserListState();
}

class _buildUserListState extends State<buildUserList> {
  final Switcher switching= new Switcher();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        print('error');
      }
      if (snapshot.hasData) {
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      } else {
        // Handle the case where snapshot.data is null, e.g., show a loading indicator
        return CircularProgressIndicator(); // You can replace this with your loading widget.
      }
    },
    );
  }
  //build individual user list item
  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    //display all user except the one currently logged in
    if(FirebaseAuth.instance.currentUser!.email != data['email']){
      return GestureDetector(
        onTap: (){
          setState(() {
            switching.a=1;
          });
          print(switching.a);
          print('hehe');
          print('lul');
        },
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffBDB0CEFF),),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xffBDB0CEFF),
                  height: 70,
                  width: 230,
                  child: Text(data['email'],style: TextStyle(fontSize: 25),),
                )),
          ],
        )
      );
    }
    else {
      return Container();
    }
  }
}

