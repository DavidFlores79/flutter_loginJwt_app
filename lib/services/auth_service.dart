import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _apiUrl = '205.251.136.75';
  final String _proyectName = '/HopeV200';
  final storage = FlutterSecureStorage();

  Future<String?> loginUser(String nickname, String password) async {
    final Map<String, dynamic> authData = {
      'nickname': nickname,
      'password': password
    };

    final url = Uri.http(_apiUrl, '$_proyectName/api/login', authData);

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodedResp = json.decode(response.body);

    //print(decodedResp);
    if (decodedResp['code'] == 200) {
      //guardar el token y la info del usuario
      await storage.write(key: 'jwtToken', value: decodedResp['jwt']);
      return null;
    } else {
      return decodedResp['message'];
    }
  }

  Future logout() async {
    await storage.deleteAll();
    notifyListeners();
    return;
  }

  Future<String> getToken() async {
    return await storage.read(key: 'jwtToken') ?? '';
  }
}
