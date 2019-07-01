import 'package:flutter/material.dart';

class CadReceita extends StatelessWidget{

  void salvar(){

  }

  void excluir(){

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de tipo de Receita'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right:16, top:16),
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Descrição'
                ),
              ),
              RaisedButton(
                child: Text(
                  'Salvar'
                ),
                onPressed: salvar,
              ),
              RaisedButton(
                child: Text(
                  'Excluir'
                ),
                onPressed: excluir,
              ),
            ],
          ),
        ),
      ),
    );
  }
}