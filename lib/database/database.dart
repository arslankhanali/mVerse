// This file can be used to any SQLite use for any porject
import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final watchList = 'watchlist';
class DatabaseProvider {
  // This is singleton class has only one instance and it is created
  // in the line below using private constructor
  static final DatabaseProvider dbProvider = DatabaseProvider(); 

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    //Gets a path where application files are stored. It is different for ios and 
    // android, so we use this function to fetch it
    Directory documentsDirectory = await getApplicationDocumentsDirectory(); 

    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "watchlist.db");

    // open database connection
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  // todoTABLE is the name of the table. defined at top==> final todoTABLE = 'Todo';
  // execute execute the string as a command in terminal (I think??)
  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $watchList ("
        "id INTEGER PRIMARY KEY, "
        "name TEXT, "
        /*SQLITE doesn't have boolean type
        so we store isDone as integer where 0 is false
        and 1 is true*/
        "torrenturl TEXT "
        ")");
  }
}
