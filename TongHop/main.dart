import 'user_service.dart';

void main() {
  List<int> userIds = [101, 102, 103];

  for (int id in userIds) {
    getUserById(id)
        .then((user) {
          print(
            'User ID: ${user['id']}, '
            'Name: ${user['name']}, '
            'Age: ${user['age']}'
          );
        })
        .catchError((error) {
          print('Loi voi userId $id: $error');
        });
  }
}