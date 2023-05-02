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
  Future<String> registerUser(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(registerUserApi),
          body: json.encode({'email': email, 'password': password, 'returnSecureToken': true}));

      if (response.statusCode == 200) {
        Map map = json.decode(response.body);
        print(map);
        uid = map['localId'];
         if (map.containsKey('idToken')) {
        // Sign up successful
        // Save user data to Firestore database
        final userId = map['localId'];
        final firestoreUrl =
            'https://firestore.googleapis.com/v1/projects/$projectID/databases/(default)/documents/FIRESTOR?documentId=123';
       var responce2= await http.post(
          Uri.parse(firestoreUrl),
          headers: {'Authorization': 'Bearer ${map['idToken']}'},
          body: json.encode({
            'fields': {
              'userId': {'stringValue': userId},
              'displayName': {'stringValue': 'displayName'},
            }
          }),
        );
        print(responce2.statusCode);
        Map map2 = json.decode(responce2.body);
        print(map2);
        }
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
Future<void> newRegister(String authToken)async{
  final userId = uid;
final documentId = uid; // Replace with your custom document ID
final firestoreUrl =
  'https://firestore.googleapis.com/v1/projects/fir-api-ac560/databases/(default)/documents/users}/$documentId?documentId=$documentId';
var responce=await http.post(
  Uri.parse(firestoreUrl),
  headers: {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json'
  },
  body: json.encode({
    'fields': {
      'userId': {'stringValue': userId},
      'displayName': {'stringValue': 'displayName'},
    }
  }),
);
Map map = json.decode(responce.body);
        print(map);
}
  Future<void> regiter(AppUser appUser, String idToken) async {
    String documentId = appUser.uid;
    String NOTE_API =
        "https://firestore.googleapis.com/v1/projects/fir-api-ac560/databases/(default)/documents/cities/LA";
    try {
      var response = await http.post(Uri.parse(NOTE_API),
          headers: {'Authorization': 'Bearer $idToken'},
          body: json.encode({
            'fields': {
              'userId': {'stringValue': appUser.uid},
              'displayName': {'stringValue': appUser.email},
            }
          }));

      if (response.statusCode == 200) {
        Map map = json.decode(response.body);
        print(map);
      } else {
        Map map = json.decode(response.body);
        print(map);
        throw ('app errors');
      }
    } catch (err) {
      throw err;
    }
  }
}
