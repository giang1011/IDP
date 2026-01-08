import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

class UpdateStudent {
  final StudentRepository repo;

  UpdateStudent(this.repo);

  void execute(Student student) {
    student.validate();

    if (repo.emailExists(student.email, excludeId: student.id)) {
      throw Exception('Email da ton tai');
    }

    repo.update(student);
  }
}
