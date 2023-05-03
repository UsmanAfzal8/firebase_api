import 'package:flutter/material.dart';
import 'package:flutter_firebase_api/database/auth_api.dart';
import 'package:flutter_firebase_api/widget/custom_elevtaed_button.dart';
import 'package:flutter_firebase_api/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _email = TextEditingController(text: 'testing12@testing.com');
  final TextEditingController _password = TextEditingController(text: '12345678');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: _email,
            hint: 'email',
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: _password,
            hint: 'password',
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
              title: 'Login',
              textStyle: TextStyle(color: Colors.white),
              onTap: () async {
                AuthApi().signInUser(_email.text, _password.text);
              }),
        ],
      ),
    );
  }
}
