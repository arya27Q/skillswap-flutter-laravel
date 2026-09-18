import 'package:flutter/material.dart';
import 'package:skillswap_frontend/core/constants/app_colors.dart';

class ExploreProjectsScreen extends StatelessWidget {
  const ExploreProjectsScreen({super.key});

  Widget _buildFilterPill(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryTan : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          if (!isActive)
            BoxShadow(
              color: AppColors.darkBrown.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey.shade600,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTaskCard(String title, String desc, String tags) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBrown.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.warmOffWhite,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.computer_rounded, color: AppColors.primaryTan),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.darkBrown)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 12),
                Text(tags, style: const TextStyle(color: AppColors.primaryTan, fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore Projects',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBrown,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.chat_bubble_outline, color: AppColors.darkBrown),
                    const SizedBox(width: 16),
                    Icon(Icons.notifications_none, color: AppColors.darkBrown),
                  ],
                ),
              ],
            ),
          ),
          
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkBrown.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for projects...',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: const Icon(Icons.search, color: AppColors.primaryTan),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Filter Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _buildFilterPill('All', true),
                _buildFilterPill('Cash Task', false),
                _buildFilterPill('Barter', false),
                _buildFilterPill('Web Dev', false),
                _buildFilterPill('Design', false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // List Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 100),
              child: Column(
                children: [
                  _buildListTaskCard('E-Commerce Website', 'Need fullstack dev for local fashion brand', 'Cash Task • Rp 1.5M'),
                  _buildListTaskCard('Social Media Content', 'Create 10 Instagram posts for Cafe', 'Barter • Free Coffee 1 Mo'),
                  _buildListTaskCard('Menu UI Redesign', 'Redesign app for local restaurant', 'Cash Task • Rp 500k'),
                  _buildListTaskCard('Inventory System', 'Desktop app for hardware store', 'Barter • Store Credit'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
