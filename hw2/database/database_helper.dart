import 'package:sqlite3/sqlite3.dart';
import '../models/student.dart';

class DatabaseHelper {
  late Database db;

  DatabaseHelper() {
    db = sqlite3.open('students.db');
    createTable();
  }

  void createTable() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id TEXT PRIMARY KEY,
        name TEXT,
        age INTEGER,
        major TEXT,
        gpa REAL
      )
    ''');
  }

  void insertStudent(Student s) {
    db.execute(
      'INSERT INTO students VALUES (?, ?, ?, ?, ?)',
      [s.id, s.name, s.age, s.major, s.gpa],
    );
  }

  List<Student> getAllStudents() {
    final rs = db.select('SELECT * FROM students');
    return rs.map((row) {
      return Student(
        row['id'],
        row['name'],
        row['age'],
        row['major'],
        row['gpa'],
      );
    }).toList();
  }

  Student? findById(String id) {
    final rs =
        db.select('SELECT * FROM students WHERE id = ?', [id]);

    if (rs.isEmpty) return null;

    final row = rs.first;
    return Student(
      row['id'],
      row['name'],
      row['age'],
      row['major'],
      row['gpa'],
    );
  }
}
