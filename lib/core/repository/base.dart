import 'package:slot_service_app/core/network/client.dart';
import 'package:http/http.dart';
import 'package:slot_service_app/core/network/config.dart';


abstract class BaseRepository {
  Future<HttpClient> get _client async => HttpClient.instance();

  Future<NetworkConfig> get networkConfig async {
    final client = await _client;
    return client.config;
  }

  Future<Response> get(String path) async {
    final client = await _client;
    return await client.get(path);
  }

  Future<Response> post(String path, Map<String, dynamic> json) async {
    final client = await _client;
    return await client.post(path, json);
  }

  Future<Response> put(String path, Map<String, dynamic> json) async {
    final client = await _client;
    return await client.put(path, json);
  }

  Future<Response> delete(String path) async {
    final client = await _client;
    return await client.delete(path);
  }

  Future<Response> deleteWithBody(
    String path,
    Map<String, dynamic> json,
  ) async {
    final client = await _client;
    return await client.deleteWithBody(path, json);
  }
}
