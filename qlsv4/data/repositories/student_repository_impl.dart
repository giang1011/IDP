import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';
import '../database/sqlite_helper.dart';

class StudentRepositoryImpl implements StudentRepository {
  final SQLiteHelper db;

  StudentRepositoryImpl(this.db);

  @override
  void add(Student s) {
    db.db.execute(
      'INSERT INTO students VALUES (?, ?, ?, ?, ?)',
      [s.id, s.name, s.email, s.age, s.expelled ? 1 : 0],
    );
  }

  @override
  bool emailExists(String email) {
    final rs = db.db.select(
      'SELECT * FROM students WHERE email = ?',
      [email],
    );
    return rs.isNotEmpty;
  }

  @override
  List<Student> getAll() {
    final rs = db.db.select('SELECT * FROM students');
    return rs.map((r) {
      return Student(
        id: r['id'],
        name: r['name'],
        email: r['email'],
        age: r['age'],
        expelled: r['expelled'] == 1,
      );
    }).toList();
  }

  @override
  List<Student> searchByNameOrEmail(String keyword) {
    final rs = db.db.select(
      'SELECT * FROM students WHERE name LIKE ? OR email LIKE ?',
      ['%$keyword%', '%$keyword%'],
    );

    return rs.map((r) {
      return Student(
        id: r['id'],
        name: r['name'],
        email: r['email'],
        age: r['age'],
        expelled: r['expelled'] == 1,
      );
    }).toList();
  }

  @override
  List<Student> getExpelledStudents() {
    final rs =
        db.db.select('SELECT * FROM students WHERE expelled = 1');
    return rs.map((r) {
      return Student(
        id: r['id'],
        name: r['name'],
        email: r['email'],
        age: r['age'],
        expelled: true,
      );
    }).toList();
  }

  @override
  void registerSubjects(String studentId, List<String> subjects) {
    for (var s in subjects) {
      db.db.execute(
        'INSERT INTO student_subjects VALUES (?, ?)',
        [studentId, s],
      );
    }
  }

}
