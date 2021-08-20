import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/json_models/user.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:universal_html/html.dart';

class UserRepository extends BaseRepository {
  static const BASE_URL = '/v1/users';
  List<User> _users = [];

  Future<List<User>> get users async {
    final jsons = await _fetchUsers();
    _users = jsons.map((json) => json.toUser()).toList();
    return _users;
  }

  Future<Iterable<JsonUser>> _fetchUsers() async {
    final response = await get(BASE_URL);

    if (response.statusCode == HttpStatus.ok) {
      return _parseBody(response);
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка при загрузке пользователей.',
      );
    }
  }

  Future<String?> signIn(User user, String password) async {
    final json = JsonUser.fromUser(user).toJsonWithPassword(password);
    final response = await post('$BASE_URL/sign_in', json);

    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(response.body)['token'];
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return null;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка сети',
      );
    }
  }

  Future<String> saveUser(User user, String password) async {
    final json = JsonUser.fromUser(user).toJsonWithPassword(password);
    final response = await post('$BASE_URL/sign_up', json);

    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(response.body)['token'];
    } else if (response.statusCode == HttpStatus.badRequest) {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Введено неуникально значение пользователя',
      );
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка сети',
      );
    }
  }

  Iterable<JsonUser> _parseBody(http.Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonUser.fromJson(json);
    });
  }

  Future<List<User>> deleteUser(User user) async {
    final response = await deleteWithBody(
      '$BASE_URL',
      JsonUser.fromUser(user).toJson(),
    );

    if (response.statusCode == HttpStatus.noContent) {
      _users.remove(user);
      return _users;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка удаления пользователя.',
      );
    }
  }
}
