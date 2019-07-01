import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'Vaca.dart';
import 'Conexao.dart';

class VacaDao{

  Conexao cnx = new Conexao();

  void main(){
    cnx.iniciar();
  }

  Future<void> insert(Vaca vaca) async {
    final Database db = await cnx.iniciar();  

    await db.insert(
      'vaca',
      vaca.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  
  Future<List<String>> vacas() async {

    final Database db = await cnx.iniciar();

    final List<Map<String, dynamic>> maps = await db.query('vaca');

    return List.generate(maps.length, (i){
      return (maps[i]['numeroBrinco'].toString() + '--' + maps[i]['nome']);
    });
  }

  Future<void> delete(int id) async {
    final db = await cnx.iniciar();

    await db.delete(
      'vaca',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<Vaca> select(String numeroBrinco) async{

    var bdCliente = await cnx.iniciar();
    var res = await bdCliente.rawQuery("SELECT * FROM vaca"
              " WHERE numeroBrinco = $numeroBrinco"); 

    if (res.length == 0) return null;

    return new Vaca.map(res.first);
  }


  Future<int> selectQtdVacas() async {

    final Database db = await cnx.iniciar();

    final List<Map<String, dynamic>> maps = await db.query('vaca');

    return maps.length;
  }

  Future<dynamic> qtdVacas(){

    var completo = new Completer();

    completo.complete(selectQtdVacas());

    return completo.future;
  }
}