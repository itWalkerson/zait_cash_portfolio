import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/app/app_container.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 1200;
    final isTablet = screenSize.width > 768 && screenSize.width <= 1200;

    return AppContainer(
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
                ? 60
                : isTablet
                ? 50
                : 40,
      ),
      color: context.primaryColor,
      child: Column(
        children: [
          if (isDesktop)
            _buildDesktopFooter(context, isDesktop, isTablet)
          else
            _buildMobileFooter(context, isDesktop, isTablet),

          SizedBox(height: isDesktop ? 40 : 30),

          // Divider
          Container(height: 1, color: Colors.white.withOpacity(0.2)),

          SizedBox(height: isDesktop ? 30 : 20),

          // Copyright
          Text(
            '© ${DateTime.now().year} Zait Cash. All rights reserved.',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: isDesktop ? 14 : 12,
              color: Colors.white.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Transforming waste into clean energy for a sustainable future',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: isDesktop ? 13 : 11,
              color: Colors.white.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context, bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Info
        Expanded(flex: 2, child: _buildCompanyInfo(context, isDesktop)),
        SizedBox(width: isDesktop ? 60 : 40),

        // Services
        Expanded(
          child: _buildFooterColumn(
            context,
            title: 'Services',
            items: ['UCO Collection', 'Custom Containers', 'Biodiesel Recycling', 'Waste Management'],
            isDesktop: isDesktop,
          ),
        ),
        SizedBox(width: isDesktop ? 60 : 40),

        // Contact
        Expanded(
          child: _buildFooterColumn(
            context,
            title: 'Contact',
            items: ['Hotline: 3737 4166', 'Bahrain & Qatar', 'info@zaitcash.com'],
            isDesktop: isDesktop,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context, bool isDesktop, bool isTablet) {
    return Column(
      children: [
        _buildCompanyInfo(context, isDesktop),
        SizedBox(height: isTablet ? 40 : 30),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildFooterColumn(
                context,
                title: 'Services',
                items: ['UCO Collection', 'Custom Containers', 'Biodiesel Recycling', 'Waste Management'],
                isDesktop: isDesktop,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildFooterColumn(
                context,
                title: 'Contact',
                items: ['Hotline: 3737 4166', 'Bahrain & Qatar', 'info@zaitcash.com'],
                isDesktop: isDesktop,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCompanyInfo(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ZAIT CASH',
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: isDesktop ? 32 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Leading the way in sustainable used cooking oil recycling. '
          'We help businesses reduce their environmental footprint while '
          'creating clean, renewable energy.',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: isDesktop ? 15 : 14,
            color: Colors.white.withOpacity(0.8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),

        // Social Media Icons (placeholder)
        Row(
          children: [
            _buildSocialIcon(context, Icons.facebook),
            const SizedBox(width: 12),
            _buildSocialIcon(context, Icons.phone),
            const SizedBox(width: 12),
            _buildSocialIcon(context, Icons.email),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterColumn(
    BuildContext context, {
    required String title,
    required List<String> items,
    required bool isDesktop,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            fontSize: isDesktop ? 20 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              item,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: isDesktop ? 15 : 14,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AppContainer(
        width: 40,
        height: 40,
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // TODO: Implement social media link
        },
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
