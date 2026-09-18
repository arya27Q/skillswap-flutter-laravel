import 'package:flutter/material.dart';

import 'package:skillswap_frontend/features/auth/screens/splash_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/role_selection_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/student_auth_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/msme_auth_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/mentor_auth_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/student_register_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/msme_register_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/mentor_register_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/student_onboarding_screen.dart';
import 'package:skillswap_frontend/features/auth/screens/student_setup_profile_screen.dart';
import 'package:skillswap_frontend/features/dashboard/screens/student_main_layout.dart';




class AppRoutes {
  // Define Route Names
  static const String splash = '/';
  static const String roleSelection = '/role-selection';
  static const String studentAuth = '/auth/student';
  static const String msmeAuth = '/auth/msme';
  static const String mentorAuth = '/auth/mentor';
  static const String studentRegister = '/auth/student/register';
  static const String msmeRegister = '/auth/msme/register';
  static const String mentorRegister = '/auth/mentor/register';
  static const String studentOnboarding = '/auth/student/onboarding';
  static const String studentDashboard = '/dashboard/student';
  static const String studentSetupProfile = '/auth/student/setup-profile';



  // Define Route Map
  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        roleSelection: (context) => const RoleSelectionScreen(),
        studentAuth: (context) => const StudentAuthScreen(),
        msmeAuth: (context) => const MsmeAuthScreen(),
        mentorAuth: (context) => const MentorAuthScreen(),
        studentRegister: (context) => const StudentRegisterScreen(),
        msmeRegister: (context) => const MsmeRegisterScreen(),
        mentorRegister: (context) => const MentorRegisterScreen(),
        studentOnboarding: (context) => const StudentOnboardingScreen(),
        studentDashboard: (context) => const StudentMainLayout(),
        studentSetupProfile: (context) => const StudentSetupProfileScreen(),


      };
}
