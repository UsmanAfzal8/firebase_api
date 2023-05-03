import 'dart:convert';

import 'package:flutter_firebase_api/database/auth_api.dart';

import '../model/app_user.dart';
import 'package:http/http.dart' as http;
class UserApi{
   String projectID = 'fir-api-ac560';
   String collection = 'user';
    Future<bool> registerUser(AppUser appUser, String authToken) async {
    final userId = AuthApi.uid;
//final documentId = uid; // Replace with your custom document ID
    final firestoreUrl =
        'https://firestore.googleapis.com/v1/projects/$projectID/databases/(default)/documents/$collection?documentId=$userId';
    var responce = await http.post(
      Uri.parse(firestoreUrl),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'fields': {
          'user_id': {'stringValue': userId},
          'display_name': {'stringValue': appUser.name},
          'email': {'stringValue': appUser.email},
          'image_url': {'stringValue': appUser.imageUrl},
        }
      }),
    );
    if (responce.statusCode == 200) {
      Map map = json.decode(responce.body);
      print(map);
      return true;
    } else {
      Map map = json.decode(responce.body);
      print(map);
      return false;
    }
  }
  Future<void> getUser(String tokenID)async{
// final firestoreUrl =
//         'https://firestore.googleapis.com/v1/projects/$projectID/databases/(default)/documents/$collection';
//         var responce = await http.post(
//       Uri.parse(firestoreUrl),
//       headers: {
//         'Authorization': 'Bearer $tokenID',
//       },
     
//     );
 final response = await http.get(Uri.parse('https://firestore.googleapis.com/v1/projects/$projectID/databases/(default)/documents/$collection'));
     final List<dynamic> documents = json.decode(response.body)['documents'];
  final List<Map<String, dynamic>> data = documents.map((document) => document['fields'] as Map<String, dynamic>).toList();

  print(data);
  }
}