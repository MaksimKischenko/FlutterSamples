import 'dart:io';

import 'package:organization_simulation/models/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class WorkersDataBaseHelper {

static final _dbName = 'workersDatabase2.db';
static final _dbVersion = 1; 
static final _tableName = 'workersTable';

WorkersDataBaseHelper.privateConstructor();
static final WorkersDataBaseHelper instance = WorkersDataBaseHelper.privateConstructor();

static Database? _dataBase;

Future<Database?> get database async {
  if(_dataBase != null){
   return _dataBase;
  } _dataBase = await _initiateDatabase();
  return _dataBase;
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
     id INTEGER PRIMARY KEY,
     name TEXT,
     position TEXT,
     salary INTEGER,
     hours INTEGER )
     '''
   );
 }

   Future<void> insertWorker(Worker worker) async {
    final db = await database;

    await db!.insert(
      _tableName,
      worker.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Worker>> allWorkers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(_tableName);

    return List.generate(maps.length, (i) {
      return Worker(
        id: maps[i]['id'],
        name: maps[i]['name'],
        position: maps[i]['position'],
        salary: maps[i]['salary'],
        hoursInMonth: maps[i]['hours'],
      );
    });
  }

   Future<void> updateWorker(Worker worker) async {

    final db = await database;
    await db!.update(
      _tableName,
      worker.toMap(),
      where: 'id = ?',
      whereArgs: [worker.id],
    );
  }

  Future<void> deleteWorker(int id) async {
   
    final db = await database;
    await db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteWorkers() async {
   
    final db = await database;
    await db!.delete(_tableName);
  }

}