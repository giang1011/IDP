import '../entities/student.dart';

abstract class StudentRepository {
  void add(Student student);
  void update(Student student);
  void delete(String id);

  List<Student> getAll();
  Student? findById(String id);
  List<Student> searchByNameOrEmail(String keyword);
  List<Student> getExpelledStudents();

  bool emailExists(String email);
  void registerSubjects(String studentId, List<String> subjects);
}
