import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fact extends StatefulWidget {
  const Fact({Key? key}) : super(key: key);

  @override
  State<Fact> createState() => _FactState();
}

class _FactState extends State<Fact> {
  List<dynamic> fact = [];
  Future lul() async{
    final call=Uri.parse("https://api.api-ninjas.com/v1/facts?limit=1&X-Api-Key=XJxJSCMZiPEboM2096A87w==l4in3wAecefCW9nt");
    final response = await http.get(call);
    final body=response.body;
    final json=jsonDecode(body);
    setState(() {
      fact = json['facts'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(lul().toString());
  }
}
