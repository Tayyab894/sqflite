import 'package:my_appp2/models/model_student.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

final String database_name = 'student_db';
final String table_name = 'student_table';
final String column_id = 'id';
final String column_name = 'name';

class DatabaseStudent {
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  static DatabaseStudent? _databaseStudent;
  DatabaseStudent._createInstance();

  factory DatabaseStudent() {
    if (_databaseStudent == null) {
      _databaseStudent = DatabaseStudent._createInstance();
    }
    return _databaseStudent!;
  }

  Future<Database> initializeDatabase() async {
    try {
      var databasePath = await getDatabasesPath();

      String path = p.join(databasePath, database_name);

      Database database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) {
          db.execute('''

         create table $table_name (
          $column_id INTEGER PRIMARY KEY,
          $column_name text not null
         )

         ''');
        },
      );
      return database;
    } catch (e) {
      print("DatabaseError ${e.toString()}");
      return null!;
    }
  }

  Future<bool> AddStudent(ModelStudent modelStudent) async {
    try {
      Database db = await this.database;

      var result = await db.insert(table_name, modelStudent.toMap());
      return true;
    } catch (e) {
      print("DatabaseError Add function ${e.toString()}");
      return false!;
    }
  }

  Future<bool> UpdateStudent(ModelStudent modelStudent) async {
    try {
      Database db = await this.database;

      var result = await db.update(
        table_name,
        modelStudent.toMap(),
        where: "$column_id = ?",
        whereArgs: [modelStudent.id],
      );
      print("DatabaseError result ${result}");

      return true;
    } catch (e) {
      print("DatabaseError Update function ${e.toString()}");
      return false!;
    }
  }

  Future<bool> DeleteStudentById(String id) async {
    try {
      Database db = await this.database;

      var result = await db.delete(
        table_name,
        where: "$column_id = ?",
        whereArgs: [id],
      );

      print("DatabaseError result ${result}");
      return true;
    } catch (e) {
      print("DatabaseError Delete function ${e.toString()}");
      return false!;
    }
  }

  Future<bool> DeleteAllStudent() async {
    try {
      Database db = await this.database;
      var result = await db.delete(table_name);
      return true;
    } catch (e) {
      print("DatabaseError Delete All function ${e.toString()}");
      return false;
    }
  }

  Future<List<ModelStudent>> GetAllStudent() async {
    List<ModelStudent> list_student = [];

    try {
      Database db = await this.database;
      List<Map<String, dynamic>> result =
          await db.query(table_name, orderBy: "$column_id DESC");
      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          ModelStudent modelStudent =
              ModelStudent.ModelObjectfromMap(result[i]);
          list_student.add(modelStudent);
        }
      }

      return list_student;
    } catch (e) {
      print("DatabaseError Delete function ${e.toString()}");
      return list_student;
    }
  }

  Future<int> GetCountStudent() async {
    try {
      Database db = await this.database;
      List<Map<String, dynamic>> result = await db.query(table_name);

      return result.length;
    } catch (e) {
      print("DatabaseError Delete function ${e.toString()}");
      return 0;
    }
  }
}
