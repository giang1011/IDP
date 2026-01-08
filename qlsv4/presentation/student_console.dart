import 'dart:io';
import '../application/usecases/add_student.dart';
import '../application/usecases/search_student.dart';
import '../application/usecases/register_subject.dart';
import '../data/database/sqlite_helper.dart';
import '../data/repositories/student_repository_impl.dart';
import '../domain/entities/student.dart';

class StudentConsole {
  late final repo;
  late final addStudent;
  late final searchStudent;
  late final registerSubject;

  StudentConsole() {
    repo = StudentRepositoryImpl(SQLiteHelper());
    addStudent = AddStudent(repo);
    searchStudent = SearchStudent(repo);
    registerSubject = RegisterSubject(repo);
  }

  void start() {
    int choice;
    do {
      print('===== QUAN LY SINH VIEN =====');
      print('1. Them sinh vien');
      print('2. Tim sinh vien');
      print('3. Xem sinh vien bi duoi hoc');
      print('4. Dang ky mon hoc');
      print('0. Thoat');
      stdout.write('Chon: ');
      choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          add();
          break;
        case 2:
          search();
          break;
        case 4:
          register();
          break;
      }
    } while (choice != 0);
  }

  void add() {
    try {
      stdout.write('ID: ');
      String id = stdin.readLineSync()!;
      stdout.write('Ten: ');
      String name = stdin.readLineSync()!;
      stdout.write('Email: ');
      String email = stdin.readLineSync()!;
      stdout.write('Tuoi: ');
      int age = int.parse(stdin.readLineSync()!);

      addStudent.execute(
        Student(id: id, name: name, email: email, age: age),
      );
      print('Them thanh cong');
    } catch (e) {
      print('Co loi: $e');
    }
  }

  void search() {
    stdout.write('Nhap ten hoac email: ');
    String key = stdin.readLineSync()!;
    final rs = searchStudent.execute(key);
    for (var s in rs) {
      print('${s.name} - ${s.email}');
    }
  }

  void register() {
    stdout.write('ID sinh vien: ');
    String id = stdin.readLineSync()!;
    stdout.write('Mon hoc (cach nhau boi dau ,): ');
    List<String> subs =
        stdin.readLineSync()!.split(',');
    registerSubject.execute(id, subs);
    print('Dang ky mon hoc thanh cong');
  }
}
