import 'package:flutter/material.dart';
import 'package:visual/Model/Vaca.dart';
import 'package:visual/Model/VacaDao.dart';

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CadVaca(""),
    );
  }
}
*/

String vacaSelec;

class CadVaca extends StatelessWidget {

  CadVaca(String selecionada){
    vacaSelec = selecionada;
  }

  final views = <Widget>[
    TabVaca(),
    TabBezerro(),
    TabLeite()
  ];
  final tabs = <Widget>[
    Tab(text: 'Vaca'),
    Tab(text: 'Bezerro'),
    Tab(text: 'Leite')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbar'),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: views,
        ),
      ),
    );
  }
}

class TabVaca extends StatelessWidget { 
  @override

  var tfNome = TextEditingController();
  var tfNumeroBrinco = TextEditingController();
  var tfDtNascimentoAquisicao = TextEditingController();
  var tfDtCio = TextEditingController();
  var tfObservacoes = TextEditingController();

  TabVaca(){
    setarVaca(vacaSelec);
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

  void setarVaca(vacaSelec) async{
    if(vacaSelec != "" || vacaSelec != null){

      VacaDao vacaDao = new VacaDao();

      int corte = vacaSelec.indexOf('-');
      vacaSelec = vacaSelec.substring(0, corte);

      Vaca v = await vacaDao.select(vacaSelec);
      
      tfNome.text = v.Nome;
      tfNumeroBrinco.text = v.NumeroBrinco.toString();
      tfDtNascimentoAquisicao.text = v.DtNascimentoAquisicao.toString();
      tfDtCio.text = v.DtCio.toString();
    }
  }

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

class TabBezerro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class TabLeite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}