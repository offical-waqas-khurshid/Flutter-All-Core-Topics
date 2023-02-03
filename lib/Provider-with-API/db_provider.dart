import 'package:flutter_sqlite_habibi/student_db_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static Future<Database> get database async {
    var path = await getDatabasesPath();
    return _database ??= await openDatabase(
      '${path}elms.db',
      onCreate: (db, version) {
        db.execute(StudentDBProvider.createTable);
      },
      version: 1,
    );
  }
}
