class Student {
  String id;
  String name;
  String email;
  int age;
  bool expelled; 
  List<String> favoriteSubjects;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    this.expelled = false,
    List<String>? favoriteSubjects,
  }) : favoriteSubjects = favoriteSubjects ?? [];

  void validate() {
    if (age <= 18) {
      throw Exception('Tuoi sinh vien phai > 18');
    }
  }
}
