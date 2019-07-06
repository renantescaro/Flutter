import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{

  Future<Database> iniciar() async{
    return openDatabase(
      join(await getDatabasesPath(), 'bancoDados.db'),

      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE pessoa("
            +" id INTEGER PRIMARY KEY, nome TEXT, dtNascimento TEXT, rg TEXT, cpf TEXT "
            +" )",
        );
      },
      version: 3,
    );
  }
}