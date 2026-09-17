import 'package:flutter/material.dart';
import 'shared_auth_layout.dart';

class MentorAuthScreen extends StatelessWidget {
  const MentorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedAuthLayout(
      title: 'Mentor Portal',
      children: [
        buildFloatingTextField('Email', Icons.email_outlined),
        buildFloatingTextField('Password', Icons.lock_outline, isPassword: true),
        const SizedBox(height: 24),
        buildElevatedButton('Sign In', () {}),
        const SizedBox(height: 16),
        buildOutlinedButton('Apply as Mentor (Upload Portfolio)', () {}),
      ],
    );
  }
}
