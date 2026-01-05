import 'iperson.dart';

abstract class Person implements IPerson {
  String id;
  String name;
  int age;

  Person(this.id, this.name, this.age);

  @override
  void showBasicInfo() {
    print('Ma: $id');
    print('Ten: $name');
    print('Tuoi: $age');
  }

  
  void showFullInfo();
}
