import 'package:flutter/material.dart';
import 'package:flutter_firebase_api/database/auth_api.dart';
import 'package:flutter_firebase_api/model/app_user.dart';
import 'package:flutter_firebase_api/widget/custom_elevtaed_button.dart';
import 'package:flutter_firebase_api/widget/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _email =
      TextEditingController(text: 'asuihhdds7868uid6@testing.com');
  final TextEditingController _password =
      TextEditingController(text: '123645678');
  final TextEditingController _name = TextEditingController(text: 'test');
  final TextEditingController _userName =
      TextEditingController(text: 'testing');
  @override
  Widget build(BuildContext context) {
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
                CustomTextFormField(
                  controller: _name,
                  hint: 'Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _userName,
                  hint: 'User name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _email,
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _password,
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  title: 'signup',
                  onTap: () async {
                    String token = await AuthApi()
                        .registerUser(_email.text, _password.text);
                    AppUser appUser = AppUser(
                        name: _name.text,
                        email: _email.text,
                        userName: _userName.text,
                        uid: AuthApi.uid);
                    print('object');
                    await AuthApi().newRegister(token);
                    await AuthApi().regiter(appUser, token);
                    print(token);
                  },
                  textStyle: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
