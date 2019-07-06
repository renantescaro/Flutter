import 'package:flutter/material.dart';
import 'package:cad_pessoa/CadPessoa.dart';
import 'package:cad_pessoa/PessoaDao.dart';

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
        title: new Text("Pessoas"),
      ),
      body: futureBuilder,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CadPessoa("")),
        );
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      
    void abrirPessoa(String pessoaSelecionada){

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadPessoa(pessoaSelecionada)),
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
                onTap: ()=>abrirPessoa(values[index]),
              ),
              Divider(height: 2.0,),
            ],
          );
        },
    );
  }
}