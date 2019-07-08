import 'package:flutter/material.dart';

class Funcoes{

  static mensagem(BuildContext context, String mensagem, String titulo){

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  static mensagemConfirmacao(BuildContext context, String mensagem, String titulo){

    Widget btnSim = FlatButton(
      child: Text("Sim"),
      onPressed: () {

      },
    );

    Widget btnNao = FlatButton(
      child: Text("Não"),
      onPressed: () {

      },
    );

    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [
        btnSim,
        btnNao,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}