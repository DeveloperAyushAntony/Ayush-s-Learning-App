import 'package:awoke_learning_app/features/auth/presentation/screens/auth_page.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/loginpage.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/otp_page.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/user_data_page.dart';

import 'package:awoke_learning_app/features/bottomnavigation/presentation/screen_homepage.dart';
import 'package:awoke_learning_app/features/bottomnavigation/providers/bottomnav_index_provider.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  runApp(
    const MyApp(),
  );

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavIndexProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awoke Learning App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 64, 46, 228)),
          useMaterial3: false,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>
              OnBoardingScreen(), // Route for the OnBoardingScreen
          '/signup': (context) => const AuthPage(), // Route for the SignUpPage
          '/loginpage': (context) => const Loginpage(),
          '/otppage': (context) => const OtpPage(),
          '/userdatapage': (context) => const UserDataPage(),
          '/homepage': (context) => const ScreenHome(),
        },
      ),
    );
  }
}
