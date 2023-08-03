import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

 static Database? _database;

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initializedDB();
    return _database;
  }

  Future<Database> initializedDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my_database.db');

    // Open/create the database at a given path
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    // Create your database table(s) here
    await db.execute('''
      CREATE TABLE Recordings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        audioPath TEXT,
        transcription TEXT
      )
    ''');
  }

  Future<int> insertRecording(Map<String, dynamic> recording) async {
    final db = await database;
    return await db!.insert('Recordings', recording);
  }

  Future<List<Map<String, dynamic>>> getAllRecordings() async {
    final db = await database;
    return await db!.query('Recordings');
  }
}
