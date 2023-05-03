import 'dart:convert';

import 'package:flutter_firebase_api/model/app_user.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static String authUrl = '';
  String collection = 'user';
  String projectID = 'fir-api-ac560';
  static String firestore = 'https://firestore.googleapis.com/v1/projects/';
  static String uid = '';
  static String apiKey = '?key=AIzaSyCw9rhfsyxY_q6Vx5L0TakHmny6lVsY1fY';
  String get registerUserApi =>
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp$apiKey";
      String get signInApi =>
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword$apiKey";
  Future<String> signupUser(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(registerUserApi),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));

      if (response.statusCode == 200) {
        Map map = json.decode(response.body);
        uid = map['localId'];
        return map['idToken'];
      } else {
        Map map = json.decode(response.body);
        print(map);
        throw ('app errors');
      }
    } catch (err) {
      throw err;
    }
  }

 
Future<String> signInUser(String email, String password) async {
  try {
   
    var response = await http.post(Uri.parse(signInApi),
        body: json.encode({
          'email': email,
          'password': password,
          "returnSecureToken": true
        }));
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      print(map);
      uid = map['localId'];
      return map['idToken'];
     // return Utils.loginToken!;
    } else {
      Map map = json.decode(response.body);
      throw (map['error']['message']);
    }
  } catch (err) {
    throw err;
  }
}
}
