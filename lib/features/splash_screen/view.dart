import 'dart:async';
import 'package:doc_doc_application/core/utils/app_images.dart';
import 'package:doc_doc_application/core/widgets/bottom_bar_screen.dart';
import 'package:doc_doc_application/features/auth/login/presentation/screens/view.dart';
import 'package:doc_doc_application/features/onboarding_screen/view.dart';
import 'package:flutter/material.dart';
import '../../core/utils/cache_Helper.dart';
import '../../core/utils/helper_method.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2* 3.141,
    ).animate(_controller);
     _controller.repeat();


    Timer(const Duration(seconds: 2), () {
      navigatorTo(
        context: context,
        page: CacheHelper.getIfFirstTime()
            ?  new OnBoardingScreen()
            : CacheHelper.getToken().isEmpty
                ? const LoginScreen()
                : BottomBarScreen(),
        withHistory: false,
      );
    });
  }
  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(AppImage.namedSplah),
          ),
          Center(
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value,
                    child: Image.asset(
                      AppImage.backgroundSplah,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
