import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  Future<dynamic> get(url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> login(url, String username, String password) async {
    try {
      final response = await http.post(url, body: {
         "username": username,
         "password": password
          }
      );
      if (response.statusCode == 200) {
        final storage = const FlutterSecureStorage();



        return json.decode(response.body);
      }
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }




}
