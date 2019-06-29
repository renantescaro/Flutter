import 'package:flutter/material.dart';

class Vaca extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Vaca'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16, top:20),
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número brinco'
                ),
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Data Nascimento / Aquisição'
                ),
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Data Cio'
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Observações'
                ),
              ),
              RaisedButton(
                child: Text(
                  'Salvar'
                ),
              ),
              RaisedButton(
                child: Text(
                  'Excluir'
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}