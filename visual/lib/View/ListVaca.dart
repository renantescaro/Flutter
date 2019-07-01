import 'package:flutter/material.dart';
import 'package:visual/View/CadVaca.dart';
import 'package:visual/Model/VacaDao.dart';

class ListVaca extends StatelessWidget{
  @override
  VacaDao vacaDao = new VacaDao();

  Widget build(BuildContext context) {

    var futureBuilder = new FutureBuilder(
      future: vacaDao.vacas(),
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
      
    void abrirVaca(String vacaSelecionada){

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadVaca(vacaSelecionada)),
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
                onTap: ()=>abrirVaca(values[index]),
              ),
              Divider(height: 2.0,),
            ],
          );
        },
    );
  }
}