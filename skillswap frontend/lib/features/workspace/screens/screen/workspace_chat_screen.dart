import 'package:flutter/material.dart';
import 'package:skillswap_frontend/core/constants/app_colors.dart';
import 'package:skillswap_frontend/core/routes/app_routes.dart';

class WorkspaceChatScreen extends StatelessWidget {
  const WorkspaceChatScreen({super.key});

  Widget _buildBubble(String text, bool isMe, {String? attachment}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(color: Color(0xFF8C5E3C), shape: BoxShape.circle),
              child: const Center(child: Text('BN', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isMe ? AppColors.primaryTan : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(4),
                  bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(20),
                ),
                boxShadow: [
                  if (!isMe)
                    BoxShadow(color: AppColors.darkBrown.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (attachment != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.white.withValues(alpha: 0.2) : AppColors.warmOffWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.insert_drive_file_rounded, color: isMe ? Colors.white : AppColors.primaryTan),
                          const SizedBox(width: 8),
                          Text(attachment, style: TextStyle(color: isMe ? Colors.white : AppColors.darkBrown, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  Text(
                    text,
                    style: TextStyle(color: isMe ? Colors.white : AppColors.darkBrown, fontSize: 14, height: 1.4),
                  ),
                ],
              ),
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
            _buildNavItem(Icons.home_rounded),
            _buildNavItem(Icons.search_rounded),
            _buildNavItem(Icons.assignment_rounded),
            _buildNavItem(Icons.account_balance_wallet_rounded),
            _buildNavItem(Icons.person_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.grey.shade400, size: 26),
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
                // Floating Header
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                            'Messages',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkBrown),
                          ),
                        ],
                      ),
                      const Icon(Icons.more_vert_rounded, color: AppColors.darkBrown),
                    ],
                  ),
                ),
                
                // Chat bubbles
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    children: [
                      const Center(child: Text('Today, 10:42 AM', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 24),
                      _buildBubble('Hello! Are you ready to start working on the wireframes?', false),
                      _buildBubble('Yes, I am! I have reviewed the requirements you sent earlier.', true),
                      _buildBubble('Great. I attached the brand guidelines for your reference.', false, attachment: 'Brand_Guidelines.pdf'),
                      _buildBubble('Thanks, I will take a look. I should have the first draft ready by tomorrow.', true),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom area: Swipe to Complete + Nav Bar
          Positioned(
            left: 24,
            right: 24,
            bottom: 110,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.submission);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFFB88656), Color(0xFF8C5E3C)]),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8C5E3C).withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.swipe_right_alt_rounded, color: Colors.white),
                    SizedBox(width: 12),
                    Text('Swipe to Complete Task', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
          
          _buildBottomNavBarDummy(context),
        ],
      ),
    );
  }
}
