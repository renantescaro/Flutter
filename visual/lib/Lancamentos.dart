import 'package:flutter/material.dart';

class Lancamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lançamentos'),
        ),
        body: Center(
          
        ),
      ),
    );
  }
}