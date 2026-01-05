import 'person.dart';

class Student extends Person {
  String major;
  double gpa;

  Student(
    String id,
    String name,
    int age,
    this.major,
    this.gpa,
  ) : super(id, name, age);

  @override
  void showFullInfo() {
    showBasicInfo();
    print('Nganh hoc: $major');
    print('GPA: $gpa');
  }
}
