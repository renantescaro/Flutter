import 'package:flutter/material.dart';

class LanPesoLeite extends StatelessWidget{

  void salvar(){

  }

  void excluir(){

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lançamento Peso do Leite'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16, top:20),
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Data'
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso'
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
                onPressed: salvar,
              ),
              RaisedButton(
                child: Text(
                  'Excluir'
                ),
                onPressed: excluir,
              ),
            ]
          ),
        ),
      )
    );
  }
}