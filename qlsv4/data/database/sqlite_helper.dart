import 'package:sqlite3/sqlite3.dart';

class SQLiteHelper {
  late Database db;

  SQLiteHelper() {
    db = sqlite3.open('students.db');
    _createTables();
  }

  void _createTables() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT UNIQUE,
        age INTEGER,
        expelled INTEGER
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS student_subjects (
        student_id TEXT,
        subject TEXT
      )
    ''');
  }
}
