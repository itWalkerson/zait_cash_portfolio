import 'package:amazing_icons/amazing_icons.dart';
import 'package:flutter/material.dart';
import 'package:zait_cash_portfolio/core/extensions/build_context_extensions.dart';
import 'package:zait_cash_portfolio/core/widgets/app/app_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..forward();
  }

  void _onScroll() {
    if (mounted) {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/gifs/zaitcash_gif.gif',
            // 'assets/images/zaitcash.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return AppContainer(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [context.primaryColor.withValues(alpha: 0.8), context.accentColor.withValues(alpha: 0.6)],
                ),
              );
            },
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppContainer(width: double.infinity, height: 100, child: Icon(AmazingIconOutlined.arrow_down)),
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return AppScaffold(
  //     body: SingleChildScrollView(
  //       controller: _scrollController,
  //       child: Column(
  //         children: [
  //           HeroSection(scrollOffset: _scrollOffset, animationController: _animationController),
  //           ContentSection(fadeAnimation: _animationController),
  //           ServicesSection(fadeAnimation: _animationController),
  //           AboutSection(fadeAnimation: _animationController),
  //           const FooterSection(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
