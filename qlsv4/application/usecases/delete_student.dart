import '../../domain/repositories/student_repository.dart';

class DeleteStudent {
  final StudentRepository repo;

  DeleteStudent(this.repo);

  void execute(String id) {
    repo.delete(id);
  }
}
