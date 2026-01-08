import '../../domain/repositories/student_repository.dart';

class RegisterSubject {
  final StudentRepository repo;

  RegisterSubject(this.repo);

  void execute(String studentId, List<String> subjects) {
    repo.registerSubjects(studentId, subjects);
  }
}
