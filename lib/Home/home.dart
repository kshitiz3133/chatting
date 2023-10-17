import 'package:flutter/material.dart';
class Homea extends StatelessWidget {
  const Homea({Key? key}) : super(key: key);

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
                  'Home',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
