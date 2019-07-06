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
      'pessoa',
      pessoa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  
  Future<List<String>> pessoas() async {

    final Database db = await cnx.iniciar();

    final List<Map<String, dynamic>> maps = await db.query('pessoa');

    return List.generate(maps.length, (i){
      return (maps[i]['id'].toString() + '--' + maps[i]['nome']);
    });
  }

  Future<void> delete(int id) async {
    final db = await cnx.iniciar();

    await db.delete(
      'pessoa',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<Pessoa> select(int id) async{

    var bdCliente = await cnx.iniciar();
    var res = await bdCliente.rawQuery("SELECT * FROM pessoa"
              " WHERE id = " + id.toString()); 

    if (res.length == 0) return null;

    return new Pessoa.map(res.first);
  }


  Future<int> selectQtdPessoas() async {

    final Database db = await cnx.iniciar();

    final List<Map<String, dynamic>> maps = await db.query('pessoa');

    return maps.length;
  }

  Future<dynamic> qtdPessoas(){

    var completo = new Completer();

    completo.complete(selectQtdPessoas());

    return completo.future;
  }
}