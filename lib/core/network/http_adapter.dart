import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/network/uri_builder.dart';

class HttpAdapter {
  static const headers = <String, String>{
    HttpHeaders.contentTypeHeader: "application/json",
  };

  static Future<http.Response> get(String path) async {
    try {
      return http.get(UriBuilder.withoutParams(path));
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  static Future<http.Response> post(
    String path,
    Map<String, dynamic> json,
  ) async {
    try {
      return http.post(
        UriBuilder.withoutParams(path),
        headers: headers,
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  static Future<http.Response> put(
    String path,
    Map<String, dynamic> json,
  ) async {
    try {
      return http.put(
        UriBuilder.withoutParams(path),
        headers: headers,
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }

  static Future<http.Response> delete(
    String path,
    Map<String, dynamic> json,
  ) async {
    try {
      return http.delete(
        UriBuilder.withoutParams(path),
        headers: headers,
        body: jsonEncode(json),
      );
    } catch (e) {
      throw NetworkException.socketException();
    }
  }
}
