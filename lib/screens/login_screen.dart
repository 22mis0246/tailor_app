import 'package:flutter/material.dart';
import 'package:tailor_app/theme/app_theme.dart';
import 'package:tailor_app/screens/customer/customer_home_screen.dart';
import 'package:tailor_app/tailor/tailor_dashboard_screen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF12183A),
              Color(0xFF0A0E27),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 48),

                  // ── Logo ──
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gold.withOpacity(0.1),
                          border: Border.all(
                              color: AppColors.gold.withOpacity(0.3), width: 1),
                        ),
                      ),
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.gold, Color(0xFFB8860B)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gold.withOpacity(0.5),
                              blurRadius: 24,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text('✂️', style: TextStyle(fontSize: 38)),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ── Title ──
                  const Text(
                    'TAILOR',
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Marketplace',
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 34,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 48,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.transparent, AppColors.gold, Colors.transparent],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Custom clothes, crafted for you',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 15),
                  ),

                  const SizedBox(height: 56),

                  // ── Role label ──
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                              color: AppColors.divider, thickness: 1)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text('Continue as',
                            style: TextStyle(
                                color: AppColors.textMuted, fontSize: 13)),
                      ),
                      Expanded(
                          child: Divider(
                              color: AppColors.divider, thickness: 1)),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ── Customer Card ──
                  _RoleCard(
                    emoji: '🛍️',
                    role: 'Customer',
                    subtitle: 'Browse & order custom outfits',
                    gradient: const [Color(0xFF1A3A2E), Color(0xFF0D2A20)],
                    borderColor: AppColors.emerald,
                    accentColor: AppColors.emeraldLight,
                    features: const [
                      '✦  Browse tailor designs',
                      '✦  Enter measurements',
                      '✦  Track your orders',
                    ],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CustomerHomeScreen()),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Tailor Card ──
                  _RoleCard(
                    emoji: '🧵',
                    role: 'Tailor',
                    subtitle: 'Showcase your craft & earn',
                    gradient: const [Color(0xFF3A2A0A), Color(0xFF2A1A00)],
                    borderColor: AppColors.gold,
                    accentColor: AppColors.goldLight,
                    features: const [
                      '✦  Upload your designs',
                      '✦  Receive orders',
                      '✦  Manage measurements',
                    ],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TailorDashboardScreen()),
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'v1.0.0 · Made with ❤️ in India',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String emoji;
  final String role;
  final String subtitle;
  final List<Color> gradient;
  final Color borderColor;
  final Color accentColor;
  final List<String> features;
  final VoidCallback onTap;

  const _RoleCard({
    required this.emoji,
    required this.role,
    required this.subtitle,
    required this.gradient,
    required this.borderColor,
    required this.accentColor,
    required this.features,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor.withOpacity(0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: borderColor.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: borderColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: borderColor.withOpacity(0.3), width: 1),
                  ),
                  child: Center(
                    child:
                    Text(emoji, style: const TextStyle(fontSize: 26)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role,
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: borderColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward,
                      color: accentColor, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Divider(color: borderColor.withOpacity(0.2), height: 1),
            const SizedBox(height: 14),

            // Features
            ...features.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(f,
                  style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                      height: 1.4)),
            )),
          ],
        ),
      ),
    );
  }
}
