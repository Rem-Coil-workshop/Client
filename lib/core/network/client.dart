import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/network/uri_builder.dart';
import 'package:slot_service_app/redux/settings/state.dart';

class HttpClient {
  final UriBuilder _builder;

  static const headers = <String, String>{
    HttpHeaders.contentTypeHeader: "application/json",
  };

  HttpClient(Network config) : _builder = UriBuilder(config);

  Future<http.Response> get(String path) async {
    try {
      return http.get(_builder.withoutParams(path));
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> post(
    String path,
    Map<String, dynamic> json,
  ) async {
    try {
      return http.post(
        _builder.withoutParams(path),
        headers: headers,
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> put(
    String path,
    Map<String, dynamic> json,
  ) async {
    try {
      return http.put(
        _builder.withoutParams(path),
        headers: headers,
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  Future<http.Response> delete(
    String path,
  ) async {
    try {
      return http.delete(
        _builder.withoutParams(path),
        headers: headers,
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }
}
