import 'student.dart';

void main() {
  print("Bat dau chuong trinh quan ly sinh vien.");

  getInformation()
      .then((List<Student> danhSach) {
        print("\n=== KET QUA DANH SACH SINH VIEN ===");
        
        for (var sv in danhSach) {
          print(sv);
        }
        
        print("====================================");
        print("Tong so sinh vien: ${danhSach.length}");
      })
      .catchError((error) {
        print("Co loi xay ra: $error");
      })
      .whenComplete(() {
        print("Ket thuc qua trinh tai du lieu.");
      });

  print("Lenh nay chay ngay lap tuc (chung minh bat dong bo).");
}