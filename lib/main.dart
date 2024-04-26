import 'package:awoke_learning_app/features/auth/presentation/screens/auth_page.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/loginpage.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    const MyApp(),
  );

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awoke Learning App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 64, 46, 228)),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoardingScreen(), // Route for the OnBoardingScreen
        '/signup': (context) => const AuthPage(), // Route for the SignUpPage
        '/loginpage': (context) => const Loginpage()
      },
    );
  }
}
