import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

class AddStudent {
  final StudentRepository repo;

  AddStudent(this.repo);

  void execute(Student student) {
    student.validate();

    if (repo.emailExists(student.email)) {
      throw Exception('Email đa ton tai');
    }

    repo.add(student);
  }
}
