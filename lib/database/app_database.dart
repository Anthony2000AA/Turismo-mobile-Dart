

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{
  final int version = 1;
  final String databaseName= 'turismo.db';
  final String tableName= 'paquetes';

  Database? _database;

  Future<Database> openDB() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version){
        String query = '''
          CREATE TABLE $tableName(
            idProducto TEXT PRIMARY KEY,
            nombre TEXT,
            descripcion TEXT,
            imagen TEXT
          )
        ''';

        db.execute( query );
      },

      version : version
    );
    return _database as Database;
  }

/*
  final String idProducto;
  final String nombre;
  final String descripcion;
  final String ubicacin;
  final String imagen;
*/

}