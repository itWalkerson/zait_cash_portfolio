import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/app/app_container.dart';

class HeroSection extends StatelessWidget {
  final double scrollOffset;
  final AnimationController animationController;

  const HeroSection({super.key, required this.scrollOffset, required this.animationController});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 1200;
    final isTablet = screenSize.width > 768 && screenSize.width <= 1200;

    // Parallax effect
    final parallaxOffset = scrollOffset * 0.5;

    return AppContainer(
      width: screenSize.width,
      height:
          isDesktop
              ? 700
              : isTablet
              ? 600
              : 500,
      child: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(0, parallaxOffset),
              child: Image.asset(
                'assets/gifs/zaitcash_gif.gif',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return AppContainer(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [context.primaryColor.withOpacity(0.8), context.accentColor.withOpacity(0.6)],
                    ),
                    child: Center(child: Icon(Icons.image, size: 100, color: context.iconColor.withOpacity(0.3))),
                  );
                },
              ),
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),

          // Animated Content
          Positioned.fill(
            child: Center(
              child: FadeTransition(
                opacity: animationController,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ZAIT CASH',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize:
                              isDesktop
                                  ? 80
                                  : isTablet
                                  ? 60
                                  : 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 4,
                          shadows: [
                            Shadow(color: Colors.black.withOpacity(0.5), offset: const Offset(2, 2), blurRadius: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Transforming Waste into Clean Energy',
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize:
                              isDesktop
                                  ? 28
                                  : isTablet
                                  ? 22
                                  : 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(color: Colors.black.withOpacity(0.5), offset: const Offset(1, 1), blurRadius: 8),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Scroll indicator
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: const Duration(seconds: 2),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(offset: Offset(0, 10 * (1 - value)), child: child),
                          );
                        },
                        child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
