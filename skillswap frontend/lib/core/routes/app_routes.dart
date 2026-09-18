import 'package:flutter/material.dart';

import 'package:skillswap_frontend/features/auth/screens/splash_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/role_selection_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/student_auth_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/msme_auth_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/mentor_auth_screen.dart';

class AppRoutes {
  // Define Route Names
  static const String splash = '/';
  static const String roleSelection = '/role-selection';
  static const String studentAuth = '/auth/student';
  static const String msmeAuth = '/auth/msme';
  static const String mentorAuth = '/auth/mentor';

  // Define Route Map
  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        roleSelection: (context) => const RoleSelectionScreen(),
        studentAuth: (context) => const StudentAuthScreen(),
        msmeAuth: (context) => const MsmeAuthScreen(),
        mentorAuth: (context) => const MentorAuthScreen(),
      };
}
