import 'dart:convert';

import 'package:http/http.dart';
import 'package:slot_service_app/core/json_models/user.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  static const UNAUTHORIZED_STATUS = 'unauthorized';
  List<User> _users = [];

  Future<List<User>> get users async {
    final jsons = await _fetchUsers();
    _users = jsons.map((json) => json.toUser()).toList();
    return _users;
  }

  Future<Iterable<JsonUser>> _fetchUsers() async {
    final response = await client.get('/v1/users');

    if (response.statusCode == 200) {
      return _parseBody(response);
    } else {
      throw NetworkException(
        code: response.statusCode,
        message:
            'Ошибка при загрузке пользователей. Возможно отсутствует подключение к интернету',
      );
    }
  }

  Future<String> signIn(User user, String password) async {
    final json = JsonUser.fromUser(user).toJson();
    json['password'] = password;
    final response = await client.post('/v1/users/sign_in', json);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body['token'];
    } else if (response.statusCode == 401) {
      return UNAUTHORIZED_STATUS;
    } else {
      throw NetworkException(
        code: response.statusCode,
      );
    }
  }

  Iterable<JsonUser> _parseBody(Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonUser.fromJson(json);
    });
  }
}
