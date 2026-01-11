class CalculatorService {
  
  Future<double> phepCong(double a, double b) async {
    return Future.delayed(Duration(seconds: 1), () => a + b);
  }

  Future<double> phepTru(double a, double b) async {
    return Future.delayed(Duration(seconds: 1), () => a - b);
  }
  Future<double> phepNhan(double a, double b) async {
    return Future.delayed(Duration(seconds: 1), () => a * b);
  }

  Future<double> phepChia(double a, double b) async {
    return Future.delayed(Duration(seconds: 1), () {
      if (b == 0) {
        throw Exception("Loi: Khong the chia cho so 0!");
      }
      return a / b;
    });
  }
}