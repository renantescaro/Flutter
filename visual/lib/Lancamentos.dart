import 'package:flutter/material.dart';

void main() => runApp(Lancamentos());

class Lancamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lançamentos',
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