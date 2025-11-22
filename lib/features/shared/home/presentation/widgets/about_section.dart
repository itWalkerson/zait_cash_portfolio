import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/app/app_container.dart';

class AboutSection extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const AboutSection({super.key, required this.fadeAnimation});

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
        color: context.scaffoldBackgroundColor,
        child: Column(
          children: [
            // Section Title
            Text(
              'About Zait Cash',
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

            // Subtitle
            Text(
              'Pioneering sustainable waste management in the Gulf region',
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

            // Content
            if (isDesktop)
              _buildDesktopLayout(context, isDesktop, isTablet)
            else
              _buildMobileLayout(context, isDesktop, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - About info
        Expanded(child: _buildAboutInfo(context, isDesktop, isTablet)),
        SizedBox(width: isDesktop ? 60 : 40),

        // Right side - Contact info
        Expanded(child: _buildContactInfo(context, isDesktop, isTablet)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isDesktop, bool isTablet) {
    return Column(
      children: [
        _buildAboutInfo(context, isDesktop, isTablet),
        SizedBox(height: isTablet ? 60 : 40),
        _buildContactInfo(context, isDesktop, isTablet),
      ],
    );
  }

  Widget _buildAboutInfo(BuildContext context, bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Mission',
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize:
                isDesktop
                    ? 32
                    : isTablet
                    ? 28
                    : 24,
            fontWeight: FontWeight.bold,
            color: context.primaryColor,
          ),
        ),
        SizedBox(height: isDesktop ? 24 : 20),
        Text(
          'Zait Cash is dedicated to providing innovative solutions for used cooking oil management. '
          'Operating across Bahrain and Qatar, we help businesses reduce their environmental impact '
          'while creating valuable renewable energy resources.',
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: isDesktop ? 17 : 15,
            color: context.primaryColor.withOpacity(0.8),
            height: 1.8,
          ),
        ),
        SizedBox(height: isDesktop ? 30 : 24),

        // Key Points
        _buildKeyPoint(
          context,
          icon: Icons.verified,
          title: 'Certified & Compliant',
          description: 'Fully licensed and environmentally certified operations',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 16),
        _buildKeyPoint(
          context,
          icon: Icons.people,
          title: 'Expert Team',
          description: 'Professional staff trained in safe oil handling and recycling',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 16),
        _buildKeyPoint(
          context,
          icon: Icons.location_on,
          title: 'Regional Coverage',
          description: 'Serving businesses across Bahrain and Qatar',
          isDesktop: isDesktop,
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isDesktop, bool isTablet) {
    return AppContainer(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: context.textTheme.headlineMedium?.copyWith(
              fontSize:
                  isDesktop
                      ? 32
                      : isTablet
                      ? 28
                      : 24,
              fontWeight: FontWeight.bold,
              color: context.primaryColor,
            ),
          ),
          SizedBox(height: isDesktop ? 30 : 24),

          // Hotline
          _buildContactItem(
            context,
            icon: Icons.phone,
            title: 'Collection Hotline',
            value: '3737 4166',
            isDesktop: isDesktop,
          ),
          const SizedBox(height: 20),

          // Location
          _buildContactItem(
            context,
            icon: Icons.location_city,
            title: 'Service Areas',
            value: 'Bahrain & Qatar',
            isDesktop: isDesktop,
          ),
          const SizedBox(height: 20),

          // Email (placeholder)
          _buildContactItem(
            context,
            icon: Icons.email,
            title: 'Email',
            value: 'info@zaitcash.com',
            isDesktop: isDesktop,
          ),
          SizedBox(height: isDesktop ? 30 : 24),

          // CTA Button
          AppContainer(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: context.accentColor,
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              // TODO: Implement contact action
            },
            child: Text(
              'Request Collection',
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: isDesktop ? 18 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyPoint(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required bool isDesktop,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: context.accentColor, size: isDesktop ? 28 : 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontSize: isDesktop ? 18 : 16,
                  fontWeight: FontWeight.bold,
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: isDesktop ? 15 : 14,
                  color: context.primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required bool isDesktop,
  }) {
    return Row(
      children: [
        AppContainer(
          width: isDesktop ? 50 : 45,
          height: isDesktop ? 50 : 45,
          color: context.accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          child: Icon(icon, color: context.accentColor, size: isDesktop ? 24 : 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: isDesktop ? 14 : 12,
                  color: context.primaryColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: context.textTheme.titleMedium?.copyWith(
                  fontSize: isDesktop ? 18 : 16,
                  fontWeight: FontWeight.bold,
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
