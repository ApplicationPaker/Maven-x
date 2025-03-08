import 'package:flutter/material.dart';
import 'package:mavenx/src/app/controllers/auth/dashboard_pro.dart';
import 'package:mavenx/src/app/controllers/auth/stepper_pro.dart';
import 'package:mavenx/src/app/controllers/chat/chat_socket_controller.dart';
import 'package:mavenx/src/app/controllers/stream/stream_pro.dart';
import 'package:mavenx/src/app/presentation/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'src/app/controllers/auth/auth_pro.dart';
import 'src/app/presentation/screens/splash/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // <------------------------  AUTHENTICATIONS PRO ------------------------>
        ChangeNotifierProvider<AuthPro>(create: (_) => AuthPro()),
        // <------------------------  STEPPER PRO ------------------------>
        ChangeNotifierProvider<StepperPro>(create: (_) => StepperPro()),
        // <------------------------  DASHBOARD PRO ------------------------>
        ChangeNotifierProvider<DashboardPro>(create: (_) => DashboardPro()),
        // <------------------------  STREAM PRO ------------------------>
        ChangeNotifierProvider<StreamPro>(create: (_) => StreamPro()),
        // <------------------------  CHAT PRO ------------------------>
       ChangeNotifierProvider<ChatSocketController>(create: (_) => ChatSocketController()),
       
      ],
      child: MaterialApp(
        title: 'Maven X',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().dark,
        home: const SplashScreen(),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
      ),
    );
  }
}
