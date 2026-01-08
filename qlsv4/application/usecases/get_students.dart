import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

class GetExpelledStudents {
  final StudentRepository repo;

  GetExpelledStudents(this.repo);

  List<Student> execute() {
    return repo.getExpelledStudents();
  }
}
