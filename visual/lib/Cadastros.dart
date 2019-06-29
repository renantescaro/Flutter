import 'package:flutter/material.dart';

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
          leading: Icon(Icons.add),
          title: Text('Cadastros'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.green[100],
              child: const Center(
                child: Text('Vacas'),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 50,
              color: Colors.green[100],
              child: const Center(child: Text('Despesas'),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 50,
              color: Colors.green[100],
              child: const Center(child: Text('Despesas'),
              ),
            ),
            Container(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}