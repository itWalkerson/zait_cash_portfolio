import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/app/app_container.dart';

class ContentSection extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const ContentSection({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 1200;
    final isTablet = screenSize.width > 768 && screenSize.width <= 1200;

    return Transform.translate(
      offset: const Offset(0, -80), // Overlap with hero section
      child: FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.2),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: fadeAnimation, curve: Curves.easeOut)),
          child: Center(
            child: AppContainer(
              width:
                  isDesktop
                      ? screenSize.width * 0.8
                      : isTablet
                      ? screenSize.width * 0.85
                      : screenSize.width * 0.9,
              padding: EdgeInsets.all(
                isDesktop
                    ? 60
                    : isTablet
                    ? 40
                    : 30,
              ),
              color: context.cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                  spreadRadius: 5,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 60,
                  offset: const Offset(0, 20),
                  spreadRadius: 10,
                ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Leading the Way in Sustainable Oil Recycling',
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontSize:
                          isDesktop
                              ? 42
                              : isTablet
                              ? 36
                              : 28,
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 30 : 20),

                  // Description
                  Text(
                    'At Zait Cash, we are committed to transforming used cooking oil into valuable resources. '
                    'Our innovative approach to waste management helps businesses and communities reduce their '
                    'environmental footprint while contributing to a cleaner, greener future.',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize:
                          isDesktop
                              ? 18
                              : isTablet
                              ? 16
                              : 14,
                      color: context.primaryColor.withOpacity(0.8),
                      height: 1.8,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 40 : 30),

                  // Stats Row
                  _buildStatsSection(context, isDesktop, isTablet),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isDesktop, bool isTablet) {
    return Wrap(
      spacing: isDesktop ? 60 : 30,
      runSpacing: 30,
      children: [
        _buildStatItem(context, icon: Icons.recycling, value: '100%', label: 'Recyclable', isDesktop: isDesktop),
        _buildStatItem(
          context,
          icon: Icons.local_shipping,
          value: '24/7',
          label: 'Collection Service',
          isDesktop: isDesktop,
        ),
        _buildStatItem(context, icon: Icons.eco, value: 'Clean', label: 'Energy Solution', isDesktop: isDesktop),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required bool isDesktop,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, animValue, child) {
        return Transform.scale(scale: 0.8 + (0.2 * animValue), child: Opacity(opacity: animValue, child: child));
      },
      child: AppContainer(
        width: isDesktop ? 200 : 150,
        child: Column(
          children: [
            Icon(icon, size: isDesktop ? 48 : 40, color: context.accentColor),
            const SizedBox(height: 12),
            Text(
              value,
              style: context.textTheme.headlineMedium?.copyWith(
                fontSize: isDesktop ? 32 : 28,
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: isDesktop ? 16 : 14,
                color: context.primaryColor.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
