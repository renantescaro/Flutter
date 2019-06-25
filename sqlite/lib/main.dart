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
  PessoaDao pessoaDao = new PessoaDao();

  Widget build(BuildContext context) {

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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child:Text('Opções'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Cad Pessoa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadPessoa()),
                );
              },                                        
            ),
            ListTile(
              title: Text('Opc2'),                                                  
            ),
            ListTile(
              title: Text('Opc3'),                                                  
            ),
          ],
        ),
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {

    void abrirPessoa(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadPessoa()),
      );
    }

    List<String> values = snapshot.data;
    return ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(values[index]),
                onTap: abrirPessoa,
              ),
              Divider(height: 2.0,),
            ],
          );
        },
    );
  }
}

class CadPessoa extends StatelessWidget {
      @override
      Widget build(BuildContext context) {

      final tfNome = new TextEditingController();
      final tfSobrenome = new TextEditingController();
      final tfIdade = new TextEditingController();

      void salvar(){
        Pessoa pessoa = new Pessoa();
        PessoaDao pessoaDao = new PessoaDao();

        pessoa.Nome = tfNome.text;
        pessoa.Sobrenome = tfSobrenome.text;
        pessoa.Idade = int.parse(tfIdade.text);

        pessoaDao.insert(pessoa);
      }

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Cad Pessoa'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20),
          child: new Form(
            child: new ListView(
              children: <Widget>[
                TextField(
                  controller: tfNome,
                  decoration: InputDecoration(
                    hintText: 'Nome'
                  ),
                ),
                TextField(
                  controller: tfSobrenome,
                  decoration: InputDecoration(
                    hintText: 'Sobrenome'
                  ),
                ),
                TextField(
                  controller: tfIdade,
                  decoration: InputDecoration(
                    hintText: 'Idade'
                  ),
                ),
              ],
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            salvar();
            
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Pessoa Salva!"),
                );
              },
            );
          },
        ),
      );
    }
  }