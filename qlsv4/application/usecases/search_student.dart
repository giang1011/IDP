import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

class SearchStudent {
  final StudentRepository repo;

  SearchStudent(this.repo);

  List<Student> execute(String keyword) {
    return repo.searchByNameOrEmail(keyword);
  }
}
