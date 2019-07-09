import 'package:flutter/material.dart';

void main() =>runApp(Inicial());

class Inicial extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('appBar'),
        ),
        body: Center(
          child: Text('Body'),
        ),
      ),
    );
  }
}