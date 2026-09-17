import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'role_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _pulseController1;
  late AnimationController _pulseController2;
  late AnimationController _pulseController3;
  late AnimationController _floatController;
  late AnimationController _tapController;

  @override
  void initState() {
    super.initState();
    
    // Ring 1 (inner): 2.4s -> 1200ms bolak balik
    _pulseController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    
    // Ring 2: 3.0s -> 1500ms
    _pulseController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _pulseController2.repeat(reverse: true);
    });

    // Ring 3 (outer): 3.6s -> 1800ms
    _pulseController3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    // Particle float (muter terus tanpa reverse untuk efek muncul hilang muncul hilang)
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    )..repeat();

    // Tap pulse & Loading dots sweep: 2s (bolak balik)
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController1.dispose();
    _pulseController2.dispose();
    _pulseController3.dispose();
    _floatController.dispose();
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmOffWhite,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const RoleSelectionScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Subtle Radial Ambient Background
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryTan.withOpacity(0.09),
                    Colors.transparent,
                  ],
                  radius: 0.8,
                  center: const FractionalOffset(0.5, 0.44),
                ),
              ),
            ),

            // Center Composition
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                
                // Ring Stack & Logo & Particles terpusat
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Particles layer
                      _buildParticles(),

                      // Ring 3 (Outermost)
                      _buildRing(_pulseController3, 220, 0.95, 1.45, 0.25, 0.04, 1.5),
                      // Ring 2
                      _buildRing(_pulseController2, 172, 0.9, 1.3, 0.4, 0.08, 1.5),
                      // Ring 1 (Inner)
                      _buildRing(_pulseController1, 130, 0.85, 1.15, 0.6, 0.15, 2.0),

                      // Logo Card squircle dengan gradient
                      AnimatedBuilder(
                        animation: _pulseController1,
                        builder: (context, child) {
                          final glow = _pulseController1.value * 14.0; 
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFFFFDF8), Color(0xFFFFF3E0)],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryTan.withOpacity(0.30),
                                  blurRadius: 48,
                                  offset: const Offset(0, 20),
                                ),
                                BoxShadow(
                                  color: const Color(0xFF4D332D).withOpacity(0.12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                                BoxShadow(
                                  color: AppColors.primaryTan.withOpacity(0.08),
                                  blurRadius: 0,
                                  spreadRadius: glow,
                                ),
                              ],
                              border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.schedule_rounded,
                                size: 40,
                                color: AppColors.primaryTan,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 28),
                
                // Title
                const Text(
                  'TalentSync',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryTan,
                    letterSpacing: -1.5,
                    height: 1.0,
                  ),
                ),
                
                const SizedBox(height: 6),
                
                // Subtitle
                const Text(
                  'Belajar \u2022 Berkarya \u2022 Berkembang',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.tertiaryCaramel,
                    letterSpacing: 0.5,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Animasi Loading Dots (Sapuan nyala dari kiri ke kanan berulang)
                AnimatedBuilder(
                  animation: _tapController,
                  builder: (context, child) {
                    // sweepValue gerak bolak-balik dari 0.0 sampai 4.0
                    final sweepingValue = _tapController.value * 4;
                    
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        // Semakin dekat index titiknya dengan sweepValue, semakin solid warnanya
                        final distance = (sweepingValue - index).abs();
                        final opacity = (1.0 - (distance * 0.5)).clamp(0.2, 1.0);
                        final scale = (1.0 - (distance * 0.2)).clamp(0.8, 1.2);

                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.primaryTan.withOpacity(opacity),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                
                const Spacer(flex: 3),
                
                // Tap anywhere
                AnimatedBuilder(
                  animation: _tapController,
                  builder: (context, child) {
                    final opacity = 0.5 + (_tapController.value * 0.5);
                    return Opacity(
                      opacity: opacity,
                      child: Text(
                        'Tap anywhere to continue',
                        style: TextStyle(
                          color: AppColors.darkCharcoal.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 56),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRing(AnimationController controller, double size, double minScale, double maxScale, double maxOp, double minOp, double borderWidth) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final scale = minScale + (controller.value * (maxScale - minScale));
        final opacity = maxOp - (controller.value * (maxOp - minOp));
        
        return Transform.scale(
          scale: scale,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryTan.withValues(alpha: opacity.clamp(0.0, 1.0)),
                width: borderWidth,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildParticles() {
    final particles = [
      {'x': 20.0, 'y': 40.0, 'size': 6.0, 'color': AppColors.primaryTan, 'delay': 0.0},
      {'x': 200.0, 'y': 30.0, 'size': 4.0, 'color': AppColors.tertiaryCaramel, 'delay': 0.15},
      {'x': 40.0, 'y': 200.0, 'size': 5.0, 'color': AppColors.primaryTan, 'delay': 0.35},
      {'x': 210.0, 'y': 190.0, 'size': 3.0, 'color': AppColors.primaryTan.withOpacity(0.5), 'delay': 0.60},
      {'x': 10.0, 'y': 120.0, 'size': 4.0, 'color': AppColors.tertiaryCaramel, 'delay': 0.25},
      {'x': 230.0, 'y': 130.0, 'size': 5.0, 'color': AppColors.primaryTan, 'delay': 0.70},
      {'x': 120.0, 'y': 10.0, 'size': 3.0, 'color': AppColors.primaryTan.withOpacity(0.5), 'delay': 0.45},
      {'x': 130.0, 'y': 230.0, 'size': 4.0, 'color': AppColors.tertiaryCaramel, 'delay': 0.85},
    ];

    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        return Stack(
          children: particles.map((p) {
            double progress = (_floatController.value + (p['delay'] as double)) % 1.0;
            
            double opacity;
            if (progress < 0.5) {
              opacity = progress * 2.0; 
            } else {
              opacity = 1.0 - ((progress - 0.5) * 2.0); 
            }
            
            double yOffset = -25.0 * progress;

            return Positioned(
              left: p['x'] as double,
              top: (p['y'] as double) + 10,
              child: Transform.translate(
                offset: Offset(0, yOffset),
                child: Container(
                  width: p['size'] as double, 
                  height: p['size'] as double,
                  decoration: BoxDecoration(
                    color: (p['color'] as Color).withOpacity(opacity.clamp(0.0, 1.0)),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
