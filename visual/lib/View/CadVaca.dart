import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visual/Model/VacaDao.dart';
import 'package:visual/Model/Vaca.dart';

class CadVaca extends StatelessWidget{

  void salvar(){

  }

  void excluir(){

  }

  String vacaSelecionada;

  
  CadVaca(String vacaSelecionada){
    this.vacaSelecionada = vacaSelecionada;

    main();
  }


  main() async{
    if(vacaSelecionada != ""){

      VacaDao vacaDao = new VacaDao();
      VacaTab vt;
      
      int corte = vacaSelecionada.indexOf('-');
      vacaSelecionada = vacaSelecionada.substring(0, corte);

      Completer c = new Completer();

      c.complete(vacaDao.select(vacaSelecionada));

      var temp = await c.future;

      vt = new vt.setarCampos(temp);
    }
  }

  @override
  Widget build(BuildContext context){
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Vaca'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Vaca",
              ),
              Tab(
                text: "Filhos",
              ),
              Tab(
                text: "Leite",
              ),
            ]
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            vacaTab(),
            leiteTab(),
            filhoTab(),
          ]
        ),
      ),
    );
  }
}

class vacaTab extends StatefulWidget {
  @override
  VacaTab createState() => new VacaTab();
}

class filhoTab extends StatefulWidget {
  @override
  FilhoTab createState() => new FilhoTab();
}

class leiteTab extends StatefulWidget {
  @override
  LeiteTab createState() => new LeiteTab();
}

class VacaTab extends State<vacaTab> {
  
  Vaca vaca = new Vaca();

  final tfNome = TextEditingController();
  final tfNumeroBrinco = TextEditingController();
  final tfDtNascimentoAquisicao = TextEditingController();
  final tfDtCio = TextEditingController();
  final tfObservacoes = TextEditingController();

  void setarCampos(vaca){

    setState(() {
      this.vaca = vaca;
    });

    tfNome.text = vaca.Nome;
    tfNumeroBrinco.text = vaca.NumeroBrinco.toString();
    tfDtNascimentoAquisicao.text = vaca.DtNascimentoAquisicao.toString();
    tfDtCio.text = vaca.DtCio.toString();
  }

  void salvar(){

    Vaca vaca = new Vaca();
    VacaDao vacaDao = new VacaDao();

    vaca.nome = tfNome.text;
    vaca.numeroBrinco = int.parse(tfNumeroBrinco.text);
    vaca.dtNascimentoAquisicao = new DateTime.now();
    vaca.dtCio = new DateTime.now();
    vacaDao.insert(vaca);

    tfNome.clear();
    tfNumeroBrinco.clear();
    tfDtNascimentoAquisicao.clear();
    tfDtCio.clear();
  }

  void excluir(){

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 16, right:16, top:16),
      children: <Widget>[
        TextField(
          controller: tfNome,
          decoration: InputDecoration(
            labelText: 'Nome'
          ),
        ),
        TextField(
          controller: tfNumeroBrinco,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Número brinco'
          ),
        ),
        TextField(
          controller: tfDtNascimentoAquisicao,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: 'Data Nascimento / Aquisição'
          ),
        ),
        TextField(
          controller: tfDtCio,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: 'Data Cio'
          ),
        ),
        TextField(
          controller: tfObservacoes,
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
      ],
    );
  }
}

class FilhoTab extends State<filhoTab> {
  
  void salvar(){

  }

  void excluir(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );
  }
}

class LeiteTab extends State<leiteTab> {
  
  void salvar(){

  }

  void excluir(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );
  }
}