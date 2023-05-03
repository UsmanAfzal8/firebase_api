import 'package:flutter/material.dart';
import 'package:flutter_firebase_api/database/auth_api.dart';
import 'package:flutter_firebase_api/model/app_user.dart';
import 'package:flutter_firebase_api/provider/auth_provider.dart';
import 'package:flutter_firebase_api/widget/custom_elevtaed_button.dart';
import 'package:flutter_firebase_api/widget/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../database/user_api.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authPro = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'SignUp',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () => authPro.pickProfilePhoto(),
                  child: authPro.profilePhoto == null
                      ? Container(
                          height: 106,
                          width: 106,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          //child: Image.memory(authPro.profilePhoto!),
                        )
                      : CircleAvatar(
                          radius: 56,
                          backgroundImage: MemoryImage(authPro.profilePhoto!),
                          backgroundColor: Colors.red,
                        ),
                ),
                CustomTextFormField(
                  controller: authPro.name,
                  hint: 'Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: authPro.userName,
                  hint: 'User name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: authPro.email,
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: authPro.password,
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  title: 'signup',
                  onTap: () async => authPro.onRegister(),
                  textStyle: const TextStyle(color: Colors.white),
                ),
                 const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  title: 'signup',
                  onTap: () async {
                    await UserApi().getUser();
                  },
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
