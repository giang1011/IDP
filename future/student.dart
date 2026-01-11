class Student {
  final String id;
  final String fName;
  final String lName;
  final DateTime birthday;
  final String phone;
  final String email;

  Student({
    required this.id,
    required this.fName,
    required this.lName,
    required this.birthday,
    required this.phone,
    required this.email,
  });

  String get formattedDate {
    return "${birthday.day.toString().padLeft(2, '0')}/"
           "${birthday.month.toString().padLeft(2, '0')}/"
           "${birthday.year}";
  }

  @override
  String toString() {
    return "ID: $id | Ten: $fName $lName | Ngay sinh: $formattedDate | DT: $phone";
  }
}

Future<List<Student>> getInformation() {
  print("--- Dang tai du lieu tu he thong... ---");

  // Mo phong thoi gian cho 2 giay
  return Future.delayed(Duration(seconds: 2), () {
    return [
      Student(
        id: "SV01",
        fName: "Nguyen",
        lName: "Van A",
        birthday: DateTime(2002, 1, 1),
        phone: "0912345678",
        email: "vana@gmail.com",
      ),
      Student(
        id: "SV02",
        fName: "Le",
        lName: "Thi B",
        birthday: DateTime(2003, 5, 12),
        phone: "0988888777",
        email: "thib@gmail.com",
      ),
      Student(
        id: "SV03",
        fName: "Tran",
        lName: "Hoang C",
        birthday: DateTime(2001, 11, 20),
        phone: "0901112223",
        email: "hoangc@gmail.com",
      ),
    ];
  });
}