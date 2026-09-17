import 'package:flutter/material.dart';
import 'shared_auth_layout.dart';

class StudentAuthScreen extends StatelessWidget {
  const StudentAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedAuthLayout(
      title: 'Student Portal',
      children: [
        buildFloatingTextField('Email', Icons.email_outlined),
        buildFloatingTextField('Password', Icons.lock_outline, isPassword: true),
        const SizedBox(height: 24),
        buildElevatedButton('Sign In', () {}),
        const SizedBox(height: 16),
        buildOutlinedButton('Register with KTM', () {}),
        buildOutlinedButton('Login via SSO Kampus', () {}),
      ],
    );
  }
}
