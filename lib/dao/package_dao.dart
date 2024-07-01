

import 'package:sqflite/sqflite.dart';
import 'package:turismo/database/app_database.dart';
import 'package:turismo/models/package.dart';

class PackageDao{
  

  insertPackage(Package package)async {
    
    Database database = await AppDatabase().openDB();
    await database.insert(AppDatabase().tableName, package.toMap());
  }

  //delete pacakage
  deletePackage(String idPackage) async {
    Database database = await AppDatabase().openDB();
    await database.delete(AppDatabase().tableName, where: 'idProducto = ?', whereArgs: [idPackage]);
  }


  Future<bool> isFavorite(String idPackage) async {
    Database database = await AppDatabase().openDB();
    List<Map<String, dynamic>> result = await database.query(AppDatabase().tableName, where: 'idProducto = ?', whereArgs: [idPackage]);
    return result.isNotEmpty;
  }

  Future<List> getFavorites() async {
    Database database = await AppDatabase().openDB();
    List<Map<String, dynamic>> result = await database.query(AppDatabase().tableName);
    return result.map((e) => PackageFavorite.fromMap(e)).toList();
  }
}