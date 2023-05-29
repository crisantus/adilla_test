import 'package:ardilla_test/screens/onboarding.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../widget/navigation_type.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Future<void> openSecondSplash(context) async {
    await Future.delayed(const Duration(seconds: 8));
    Navigator.push(
      context,
      SlideTransition2(
        const OnboardingScreen(),
      ),
    );
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    openSecondSplash(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: kDefaultAppColor,
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 1.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
