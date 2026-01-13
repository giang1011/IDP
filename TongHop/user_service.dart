Future<Map<String, dynamic>> getUserById(int id) {
  return Future.delayed(Duration(seconds: 1), () {
    return {
       'id': 101,
        'name': 'User101',
        'age': 20
    };
  } else {
    throw Exception('User not found');
  });
}