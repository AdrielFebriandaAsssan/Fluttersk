import 'package:dio/dio.dart';
import 'package:pjsk/model/usermodel.dart';

class UserService {
  final Dio dio = Dio();

  static const baseUrl = 'https://reqres.in/api';
  static const users = 'users';

  // Fetch all users
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await dio.get('$baseUrl/$users', queryParameters: {'page': 1});

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Fetch a single user by ID
  Future<UserModel> fetchUserById(int id) async {
    try {
      final response = await dio.get('$baseUrl/$users/$id');

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return UserModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch user details');
      }
    } catch (e) {
      rethrow;
    }
  }
}
