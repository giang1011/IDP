import 'calculator.dart';

void main() async {
  final calculator = CalculatorService();
  
  double soA = 10;
  double soB = 5;

  print("--- Bat dau thuc hien cac phep tinh (doi 1 giay moi phep) ---");
  print("So A: $soA, So B: $soB\n");

  try {
  
    double tong = await calculator.phepCong(soA, soB);
    print("Ket qua phep cong: $tong");

    double hieu = await calculator.phepTru(soA, soB);
    print("Ket qua phep tru: $hieu");

    double tich = await calculator.phepNhan(soA, soB);
    print("Ket qua phep nhan: $tich");

    double thuong = await calculator.phepChia(soA, soB);
    print("Ket qua phep chia: $thuong");

    
    print("\nDang thu nghiem phep chia cho 0...");
    await calculator.phepChia(soA, 0);

  } catch (e) {
    
    print("Xay ra loi: $e");
  } finally {
    print("\n--- Tat ca phep tinh da hoan tat ---");
  }
}