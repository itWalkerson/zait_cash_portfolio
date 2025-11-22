import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/app/app_container.dart';

class ServicesSection extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const ServicesSection({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 1200;
    final isTablet = screenSize.width > 768 && screenSize.width <= 1200;

    return FadeTransition(
      opacity: fadeAnimation,
      child: AppContainer(
        width: screenSize.width,
        padding: EdgeInsets.symmetric(
          horizontal:
              isDesktop
                  ? 80
                  : isTablet
                  ? 40
                  : 20,
          vertical:
              isDesktop
                  ? 100
                  : isTablet
                  ? 80
                  : 60,
        ),
        child: Column(
          children: [
            // Section Title
            Text(
              'Our Services',
              style: context.textTheme.displayMedium?.copyWith(
                fontSize:
                    isDesktop
                        ? 48
                        : isTablet
                        ? 40
                        : 32,
                fontWeight: FontWeight.bold,
                color: context.primaryColor,
              ),
            ),
            SizedBox(height: isDesktop ? 20 : 15),
            Text(
              'Comprehensive solutions for used cooking oil management',
              style: context.textTheme.titleMedium?.copyWith(
                fontSize:
                    isDesktop
                        ? 18
                        : isTablet
                        ? 16
                        : 14,
                color: context.primaryColor.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isDesktop ? 60 : 40),

            // Services Grid
            _buildServicesGrid(context, isDesktop, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context, bool isDesktop, bool isTablet) {
    final services = [
      {
        'icon': Icons.oil_barrel,
        'title': 'Used Cooking Oil Collection',
        'description':
            'We provide convenient collection services for used cooking oil from restaurants, '
            'hotels, and food establishments. Our dedicated team ensures safe and timely pickup.',
      },
      {
        'icon': Icons.inventory_2,
        'title': 'Custom Containers',
        'description':
            'We supply specialized containers designed for safe storage and transportation of '
            'used cooking oil. Available in various sizes to meet your needs.',
      },
      {
        'icon': Icons.eco,
        'title': 'Biodiesel Recycling',
        'description':
            'Transform your waste into clean energy. We recycle used cooking oil into high-quality '
            'biodiesel, contributing to a sustainable future and reducing carbon emissions.',
      },
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            services
                .map(
                  (service) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: _buildServiceCard(
                        context,
                        icon: service['icon'] as IconData,
                        title: service['title'] as String,
                        description: service['description'] as String,
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                  ),
                )
                .toList(),
      );
    } else {
      return Column(
        children:
            services
                .map(
                  (service) => Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: _buildServiceCard(
                      context,
                      icon: service['icon'] as IconData,
                      title: service['title'] as String,
                      description: service['description'] as String,
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                  ),
                )
                .toList(),
      );
    }
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required bool isDesktop,
    required bool isTablet,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform.translate(offset: Offset(0, 30 * (1 - value)), child: Opacity(opacity: value, child: child));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AppContainer(
          padding: EdgeInsets.all(
            isDesktop
                ? 40
                : isTablet
                ? 30
                : 25,
          ),
          color: context.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 4))],
          onMouseEnter: (_) {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              AppContainer(
                width: isDesktop ? 80 : 70,
                height: isDesktop ? 80 : 70,
                color: context.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                child: Icon(icon, size: isDesktop ? 40 : 35, color: context.accentColor),
              ),
              SizedBox(height: isDesktop ? 24 : 20),

              // Title
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize:
                      isDesktop
                          ? 24
                          : isTablet
                          ? 22
                          : 20,
                  fontWeight: FontWeight.bold,
                  color: context.primaryColor,
                ),
              ),
              SizedBox(height: isDesktop ? 16 : 12),

              // Description
              Text(
                description,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: isDesktop ? 16 : 14,
                  color: context.primaryColor.withOpacity(0.7),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
