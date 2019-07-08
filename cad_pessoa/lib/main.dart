import 'package:flutter/material.dart';
import 'package:cad_pessoa/CadPessoa.dart';
import 'package:cad_pessoa/PessoaDao.dart';
import 'package:cad_pessoa/Funcoes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPessoa();
  }
}

class ListPessoa extends State<MyApp> {

  @override
  PessoaDao pessoaDao = new PessoaDao();

  Widget build(BuildContext context) {

    var futureBuilder = FutureBuilder(
      future: pessoaDao.pessoas(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('Carregando...');
          default:
            if (snapshot.hasError)
              return Text('Erro: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pessoas"),
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

    void apagar(item){
      print(item);
    }

    List<String> values = snapshot.data;
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        final item = values[index];
        return Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            setState(() {
              values.removeAt(index);
            });

            Funcoes.mensagemConfirmacao(context,"Deseja apagar pessoa?","Alerta");

          },
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text('$item'),
            onTap: ()=>abrirPessoa(values[index]),
          ), 
        );
      },
    );
  }
}