import 'package:flutter/material.dart';
import 'package:visual/View/LanPrecoLeite.dart';
import 'package:visual/View/LanPesoLeite.dart';

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
          leading: Icon(Icons.add),
          title: Text('Lançamentos'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanPrecoLeite()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.green[100],
                child: const Center(
                  child: Text('Preço Leite'),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanPesoLeite()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.green[100],
                child: const Center(
                  child: Text('Peso Leite'),
                ),
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