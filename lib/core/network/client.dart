import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/network/config.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/network/uri_builder.dart';
import 'package:slot_service_app/core/network/network.dart';
import 'package:slot_service_app/core/repository/token.dart';

class HttpClient {
  static HttpClient? _instance;
  static const _headers = <String, String>{
    HttpHeaders.contentTypeHeader: "application/json",
  };

  HttpClient._();

  static Future<HttpClient> instance() async {
    if (_instance == null) {
      _instance = HttpClient._();
    }

    final config = await NetworkConfigRepository.loadConfig();
    _instance!.config = config;
    return _instance!;
  }

  late UriBuilder _builder;
  late NetworkConfig _config;

  NetworkConfig get config => _config;

  set config(NetworkConfig config) {
    _builder = UriBuilder(config);
    _config = config;
  }

  Future<http.Response> get(
      String path, Map<String, dynamic>? queryParameters) async {
    try {
      return http.get(
        _builder.build(path, queryParameters),
        headers: await _getHeaders(),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> post(String path, Map<String, dynamic> json) async {
    try {
      return http.post(
        _builder.withoutParams(path),
        headers: await _getHeaders(),
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> put(String path, Map<String, dynamic> json) async {
    try {
      return http.put(
        _builder.withoutParams(path),
        headers: await _getHeaders(),
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> delete(String path) async {
    try {
      return http.delete(
        _builder.withoutParams(path),
        headers: await _getHeaders(),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> deleteWithBody(
    String path,
    Map<String, dynamic> json,
  ) async {
    try {
      return http.delete(
        _builder.withoutParams(path),
        headers: await _getHeaders(),
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<String?> _getToken() async {
    final tokenRepository = TokenRepository.instance();
    return await tokenRepository.token;
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    if (token == null) return _headers;
    final header = Map<String, String>.from(_headers);
    header[HttpHeaders.authorizationHeader] = "Bearer $token";
    return header;
  }
}
