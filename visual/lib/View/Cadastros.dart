import 'package:flutter/material.dart';
import 'package:visual/Model/VacaDao.dart';
import 'package:visual/View/CadDespesa.dart';
import 'package:visual/View/CadReceita.dart';
import 'package:visual/View/ListVaca.dart';
import 'package:visual/View/CadVaca.dart';

class Cadastros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastros',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.add),
          title: Text('Cadastros'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            GestureDetector(
              onTap: (){

                VacaDao vacaDao = new VacaDao();
                
                if(vacaDao.qtdVacas() != null){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListVaca()),
                  );
                }
                else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadVaca("")),
                  );
                }

                
              },
              child: Container(
                height: 50,
                color: Colors.green[100],
                child: const Center(
                  child: Text('Vaca'),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadReceita()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.green[100],
                child: const Center(
                  child: Text('Tipo Receita'),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadDespesa()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.green[100],
                child: const Center(
                  child: Text('Tipo Despesa'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}