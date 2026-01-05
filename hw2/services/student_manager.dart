import 'dart:io';
import '../models/student.dart';

class StudentManager {
  List<Student> students = [];

  void showMenu() {
    print('===== MENU QUAN LY SINH VIEN =====');
    print('1. Them sinh vien');
    print('2. Hien thi danh sach sinh vien');
    print('3. Tim sinh vien theo ma');
    print('0. Thoat');
    stdout.write('Chon chuc nang: ');
  }

  void start() {
    int choice;

    do {
      showMenu();
      choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          addStudent();
          break;
        case 2:
          showAllStudents();
          break;
        case 3:
          findStudentById();
          break;
        case 0:
          print('Thoat chuong trinh!');
          break;
        default:
          print('Chuc nang khong hop le!');
      }
    } while (choice != 0);
  }

  void addStudent() {
    stdout.write('Ma SV: ');
    String id = stdin.readLineSync()!;
    stdout.write('Ten: ');
    String name = stdin.readLineSync()!;
    stdout.write('Tuoi: ');
    int age = int.parse(stdin.readLineSync()!);
    stdout.write('Nganh: ');
    String major = stdin.readLineSync()!;
    stdout.write('GPA: ');
    double gpa = double.parse(stdin.readLineSync()!);

    students.add(Student(id, name, age, major, gpa));
    print(' Them sinh vien thanh cong!');
  }

  void showAllStudents() {
    if (students.isEmpty) {
      print('Danh sach sinh vien trong!');
      return;
    }

    for (var s in students) {
      print('----------------------');
      s.showFullInfo();
    }
  }

  void findStudentById() {
    stdout.write('Nhap ma SV can tim: ');
    String id = stdin.readLineSync()!;

    for (var s in students) {
      if (s.id == id) {
        s.showFullInfo();
        return;
      }
    }
    print(' Khong tim thay sinh vien!');
  }
}
