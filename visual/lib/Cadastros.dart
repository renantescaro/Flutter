import 'package:flutter/material.dart';

void main() => runApp(Cadastros());

class Cadastros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastros',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastros'),
        ),
        body: Center(
          
        ),
      ),
    );
  }
}