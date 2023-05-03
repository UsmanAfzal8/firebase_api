
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class StorageApi{
  String bucketName='gs://fir-api-ac560.appspot.com';
  Future<String> uploadImageToFirebase(Uint8List imageFile) async {
  // Encode the image file as base64 string
  String base64Image = base64Encode(imageFile);
  print(base64Image);
  // Make a POST request to Firebase Storage API
  String url = 'https://storage.googleapis.com/upload/storage/v1/b/$bucketName/o?uploadType=media&name=1234';

  Map<String, String> headers = {
    'Content-type': 'application/json',
  };

  String body = jsonEncode({
    'data': base64Image,
    'contentType': 'image/jpeg',
  });

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  // Extract the URL from the response
  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData);
  final String imageUrl = responseData['downloadTokens'];
  final String downloadUrl = 'https://firebasestorage.googleapis.com/v0/b/gs://fir-api-ac560.appspot.com/o/imag?alt=media&token=$imageUrl';

  return downloadUrl;
}

}