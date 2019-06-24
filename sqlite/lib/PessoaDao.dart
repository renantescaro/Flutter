import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'Pessoa.dart';
import 'Conexao.dart';

class PessoaDao{

  Conexao cnx = new Conexao();

  void main(){
    cnx.iniciar();
  }

  Future<void> insert(Pessoa pessoa) async {
    final Database db = await cnx.iniciar();

    await db.insert(
      'pessoas',
      pessoa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  
  Future<List<String>> pessoas() async {

    final Database db = await cnx.iniciar();

    final List<Map<String, dynamic>> maps = await db.query('pessoas');

    return List.generate(maps.length, (i){
      return (maps[i]['id'].toString() + ' - ' + maps[i]['nome'] + ' ' + maps[i]['sobrenome']);

    /*
    return Pessoa(
      id: maps[i]['id'],
      nome: maps[i]['nome'],
      sobrenome: maps[i]['sobrenome'],
      idade: maps[i]['idade'],
    );

    */

    });
  }

  Future<void> delete(int id) async {
    final db = await cnx.iniciar();

    await db.delete(
      'pessoas',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}