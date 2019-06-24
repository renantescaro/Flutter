import 'package:flutter/material.dart';
import 'Pessoa.dart';
import 'PessoaDao.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Testando SQLite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Pessoa pessoa1 = new Pessoa();
  Pessoa pessoa2 = new Pessoa();
  PessoaDao pessoaDao = new PessoaDao();

  void iniciar(){
    
    /*
    // Descomente para inserir pessoas no BD

    pessoa1.Nome = 'Sasha';
    pessoa1.Sobrenome = 'Grey';
    pessoa1.Idade = 27;

    pessoa2.Nome = 'Thais';
    pessoa2.Sobrenome = 'Petacular';
    pessoa2.Idade = 29;

    pessoaDao.insert(pessoa1);
    pessoaDao.insert(pessoa2);
    */
  }

  Widget build(BuildContext context) {

    iniciar();

    var futureBuilder = new FutureBuilder(
      future: pessoaDao.pessoas(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('Carregando...');
          default:
            if (snapshot.hasError)
              return new Text('Erro: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pagina Principal"),
      ),
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(values[index]),
              ),
              new Divider(height: 2.0,),
            ],
          );
        },
    );
  }
}
