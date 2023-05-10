import 'dart:convert';

import 'package:flutter_firebase_api/database/auth_api.dart';

import '../model/app_user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  String projectID = 'fir-api-ac560';
  String collection = 'user';
  Future<bool> registerUser(AppUser appUser) async {
    final userId = AuthApi.uid;
//final documentId = uid; // Replace with your custom document ID
    final firestoreUrl =
        'https://firestore.googleapis.com/v1/projects/$projectID/databases/(default)/documents/$collection?documentId=$userId';
    var responce = await http.post(
      Uri.parse(firestoreUrl),
      body: appUser.toJson(),
    );
    if (responce.statusCode == 200) {
      //Map map = json.decode(responce.body);

      return true;
    } else {
      //Map map = json.decode(responce.body);

      return false;
    }
  }

  Future<void> getUser() async {
    final queryField1 = 'name';
final queryOperator1 = '==';
final queryValue1 = Uri.encodeQueryComponent('usman');
final queryFilters = [
  '$queryField1 $queryOperator1 $queryValue1',
].join(',');
    final response = await http.get(Uri.parse(
        'https://firestore.googleapis.com/v1/projects/$projectID/databases/(default)/documents/$collection?filters[]=$queryFilters'));
    final List<dynamic> documents = json.decode(response.body)['documents'];
    List<AppUser> appUser = [];
    appUser = documents
        .map((document) =>
            AppUser.fromMap(document['fields'] as Map<String, dynamic>))
        .toList();
    print(appUser);
  }
}
