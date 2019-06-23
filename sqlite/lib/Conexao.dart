import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{

  Future<Database> iniciar() async{
    return openDatabase(
    join(await getDatabasesPath(), 'bancoDados.db'),

    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE pessoas(id INTEGER PRIMARY KEY, nome TEXT, sobrenome TEXT, idade INTEGER)",
      );
    },
    version: 1,
  );
  }
}