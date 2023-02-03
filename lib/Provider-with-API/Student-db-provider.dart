import 'package:flutter_sqlite_habibi/db_provider.dart';
import 'package:flutter_sqlite_habibi/student.dart';
import 'package:sqflite/sqflite.dart';

class StudentDBProvider {
  static const tableName = 'Student';
  static const keyRollNo = 'RollNo';
  static const keyName = 'Name';
  static const keyFee = 'Fee';
  static const createTable =
      'CREATE TABLE IF NOT EXIST $tableName ($keyRollNo INTEGER PRIMARY KEY,$keyName TEXT,$keyFee REAL)';
  static const dropTable = 'DROP TABLE IF EXIST $tableName';

  Future<bool> insertStudent(Student student) async {
    Database database = await DBProvider.database;
    var rowID = await database.insert(tableName, student.toMap());
    return rowID > 0;
  }

  Future<bool> updateStudent(Student student) async {
    Database database = await DBProvider.database;
    var rowID = await database.update(tableName, student.toMap());
    return rowID > 0;
  }

  Future<bool> deleteStudent(Student student) async {
    Database database = await DBProvider.database;
    var rowID = await database
        .delete(tableName, where: '$keyRollNo =?', whereArgs: [student.rollNo]);
    return rowID > 0;
  }

  Future<List<Student>> fetchStudent() async {
    Database database = await DBProvider.database;
    var listMap = await database.query(
      tableName,
    );
    return listMap.map((map) => Student.fromMap(map)).toList();
  }
}
