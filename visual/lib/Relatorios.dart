import 'package:flutter/material.dart';

void main() => runApp(Relatorios());

class Relatorios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relatórios',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Relatórios'),
        ),
        body: Center(
          
        ),
      ),
    );
  }
}