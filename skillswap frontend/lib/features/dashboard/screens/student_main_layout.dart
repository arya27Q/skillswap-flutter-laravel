import 'package:flutter/material.dart';
import 'package:skillswap_frontend/core/constants/app_colors.dart';
import 'package:skillswap_frontend/features/dashboard/screens/dashboard_mahasiswa_screen.dart';
import 'package:skillswap_frontend/features/project/screens/explore_projects_screen.dart';
import 'package:skillswap_frontend/features/project/screens/my_projects_screen.dart';

class StudentMainLayout extends StatefulWidget {
  const StudentMainLayout({super.key});

  @override
  State<StudentMainLayout> createState() => _StudentMainLayoutState();
}

class _StudentMainLayoutState extends State<StudentMainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardMahasiswaScreen(),
    const ExploreProjectsScreen(),
    const MyProjectsScreen(),
    const Center(child: Text('Wallet Tab')),
    const Center(child: Text('Profile Tab')),
  ];

  Widget _buildNavItem(IconData icon, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryTan : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.grey.shade400,
          size: 26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmOffWhite,
      body: Stack(
        children: [
          // The current screen
          _screens[_currentIndex],
          
          // Floating Capsule Bottom Navigation Bar
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkBrown.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(Icons.home_rounded, 0),
                  _buildNavItem(Icons.search_rounded, 1),
                  _buildNavItem(Icons.assignment_rounded, 2),
                  _buildNavItem(Icons.account_balance_wallet_rounded, 3),
                  _buildNavItem(Icons.person_rounded, 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
