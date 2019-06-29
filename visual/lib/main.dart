import 'package:flutter/material.dart';
import 'Cadastros.dart';
import 'Relatorios.dart';
import 'Lancamentos.dart';
import 'Vaca.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'titulo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(
        title: 'titulo pagina'
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("620,00",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  )),

                )
              )
            ];
          },
          body: Center(
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Sitio Rosa de Saron'),
              accountEmail: Text('rosadesaron@gmail.com'),
            ),
            ListTile(
              leading: Icon(
                Icons.add
              ),
              title: Text('Cadastros'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cadastros()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance
              ),
              title: Text('Lançamentos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Vaca()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_alarm
              ),
              title: Text('Relatórios'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Relatorios()),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
