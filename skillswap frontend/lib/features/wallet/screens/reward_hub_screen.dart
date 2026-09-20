import 'package:flutter/material.dart';
import 'package:skillswap_frontend/core/constants/app_colors.dart';

class RewardHubScreen extends StatelessWidget {
  const RewardHubScreen({super.key});

  Widget _buildRewardCard(String title, String price, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBrown.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 16),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.darkBrown)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.monetization_on_rounded, color: Color(0xFFFFB300), size: 14),
                const SizedBox(width: 4),
                Text('$price TC', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFFF8F00))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBarDummy(BuildContext context) {
    return Positioned(
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
            _buildNavItem(Icons.home_rounded, false),
            _buildNavItem(Icons.search_rounded, false),
            _buildNavItem(Icons.people_rounded, false),
            _buildNavItem(Icons.account_balance_wallet_rounded, true),
            _buildNavItem(Icons.person_rounded, false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmOffWhite,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkBrown.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.warmOffWhite,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.keyboard_arrow_left_rounded, color: AppColors.darkBrown),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Reward Hub',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.darkBrown),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    children: [
                      _buildRewardCard('MSME Coffee Voucher', '15', Icons.coffee_rounded, const Color(0xFF795548)),
                      _buildRewardCard('Premium Mentoring (1 hr)', '30', Icons.workspace_premium_rounded, const Color(0xFF1976D2)),
                      _buildRewardCard('Gojek Promo Discount', '10', Icons.discount_rounded, const Color(0xFF388E3C)),
                      _buildRewardCard('SkillSwap Pro Badge', '50', Icons.verified_rounded, const Color(0xFFF57C00)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          _buildBottomNavBarDummy(context),
        ],
      ),
    );
  }
}
