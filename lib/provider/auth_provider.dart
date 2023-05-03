import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_api/model/app_user.dart';
import 'package:image_picker/image_picker.dart';

import '../database/auth_api.dart';
import '../database/storage_api.dart';
import '../utlities/image_picker.dart';

class AuthProvider with ChangeNotifier {
  onRegister() async {
    
    String imageUrl = '';
    if (profilePhoto != null) {
      print('Enter');
      String tempImage =
          await StorageApi().uploadImageToFirebase(profilePhoto!);
      print(tempImage);
      imageUrl = tempImage;
    }
//     AppUser appUser = AppUser(
//         name: name.text,
//         email: email.text,
//         userName: userName.text,
//         uid: AuthApi.uid,
//         imageUrl: '');
//         bool temp=await AuthApi().registerUser(appUser, token);
//         if(temp==true){
//           clear();
//         }
  }

  clear() {
    name.clear();
    email.clear();
    password.clear();
    userName.clear();
  }

  void pickProfilePhoto() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    if (im == null) return;
    profilePhoto = im;
    notifyListeners();
  }

  Uint8List? profilePhoto;
  final TextEditingController email =
      TextEditingController(text: 'testing12@testing.com');
  final TextEditingController password =
      TextEditingController(text: '12345678');
  final TextEditingController name = TextEditingController(text: 'usman');
  final TextEditingController userName =
      TextEditingController(text: 'usmanafzal854');
}
