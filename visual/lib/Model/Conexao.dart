import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{

  Future<Database> iniciar() async{
    return openDatabase(
      join(await getDatabasesPath(), 'bancoDados.db'),

      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE vaca("
            +" id INTEGER PRIMARY KEY, nome TEXT, dtNascimentoAquisicao DATETIME, numeroBrinco INTEGER, dtCio DATETIME "
            +" )",

            /*

            */
        );
      },
      version: 2,
    );
  }
}