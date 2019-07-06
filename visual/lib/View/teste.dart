import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CadVaca(),
    );
  }
}

class CadVaca extends StatelessWidget {
  final views = <Widget>[
    TabVaca(),
    TabBezerro(),
    TabLeite()
  ];
  final tabs = <Widget>[
    Tab(text: 'Vaca'),
    Tab(text: 'Bezerro'),
    Tab(text: 'Leite')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbar'),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: views,
        ),
      ),
    );
  }
}

class TabVaca extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class TabBezerro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class TabLeite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}