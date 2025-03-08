
import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/app_logo_widget.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

import 'splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _upController;
  late Animation<double> _upAnimation;

  late AnimationController _zoomInController;
  late Animation<double> _zoomInAnimation;

  late AnimationController _zoomOutController;
  late Animation<double> _zoomOutAnimation;

  @override
  void initState() {
    super.initState();

    // Animation for moving logo up
    _upController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _upAnimation = Tween<double>(
      begin: 0.4,
      end: -0.2, // Adjust this value as needed to control how much it moves up
    ).animate(
      CurvedAnimation(
        parent: _upController,
        curve: Curves.easeOut,
      ),
    );

    // Animation for zooming in
    _zoomInController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _zoomInAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5, // Adjust this value as needed to control the zoom level
    ).animate(
      CurvedAnimation(
        parent: _zoomInController,
        curve: Curves.easeIn,
      ),
    );

    // Animation for zooming out
    _zoomOutController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _zoomOutAnimation = Tween<double>(
      begin: 1.5,
      end: 1.0, // Return to the original scale
    ).animate(
      CurvedAnimation(
        parent: _zoomOutController,
        curve: Curves.easeOut,
      ),
    );

    _upController.forward().then((_) {
      _zoomInController.forward().then((_) {
        _zoomOutController.forward();
    SplashServices().isUserlogin(context);

      });
    });

  }

  @override
  void dispose() {
    _upController.dispose();
    _zoomInController.dispose();
    _zoomOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: kSecondaryColor),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _upController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0.0, size.height * _upAnimation.value),
                      child: child,
                    );
                  },
                  child: AnimatedBuilder(
                    animation: _zoomOutController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _zoomOutAnimation.value,
                        child: child,
                      );
                    },
                    child: AppLogoWidget(
                      height: size.height / 100 * 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
