import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper{


static final _dbName = 'workersDatabase.db';
static final _dbVersion = 1; 
static final _tableName = 'managerTable';

static final columnId = 'id';
static final columnName = 'name';

DataBaseHelper.privateConstructor();
static final DataBaseHelper instance = DataBaseHelper.privateConstructor();


static Database? _database;

Future<Database?> get database async {
  if(_database != null){
   return _database;
  } _database = await _initiateDatabase();
  return _database;
 } 

 _initiateDatabase () async {
   Directory directory = await getApplicationDocumentsDirectory();
   String path =  join(directory.path, _dbName); 
   return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
 }

 Future? _onCreate (Database db, int version) {

   db.execute(
     ''' 
     CREATE TABLE $_tableName( 
     $columnId INTEGER PRIMARY KEY,
     $columnName TEXT NOT NULL )
     '''
   );
 }

 Future<int> insert(Map<String, dynamic> row) async {

    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
 }

 Future<List<Map<String, dynamic>>> queryAll() async {
   Database? db = await instance.database;
   return await db!.query(_tableName);
 }

 Future<int> update (Map<String, dynamic> row) async {
   Database? db = await instance.database;
   int id = row[columnId];
   return await db!.update(_tableName, row, where: '$columnId = ?', whereArgs: [id] );
 }

 Future<int> delete(int id) async {
   Database? db = await instance.database;
   return await db!.delete(_tableName, where: '$columnId =?', whereArgs: [id]);
 }

}