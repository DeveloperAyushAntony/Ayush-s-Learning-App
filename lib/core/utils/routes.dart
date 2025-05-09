import 'package:awoke_learning_app/features/auth/presentation/screens/auth_page.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/loginpage.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/otp_page.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/user_data_page.dart';
import 'package:awoke_learning_app/features/bottomnavigation/presentation/screen_homepage.dart';
import 'package:awoke_learning_app/features/categories/grown_ups/presentation/grownups.dart';
import 'package:awoke_learning_app/features/categories/kg/presentation/kg_page.dart';
import 'package:awoke_learning_app/features/categories/kids/presentation/kids_page.dart';
import 'package:awoke_learning_app/features/categories/school_teens/presentation/school_teens_page.dart';
import 'package:awoke_learning_app/features/categories/veterans/presentation/veterans.dart';
import 'package:awoke_learning_app/features/courses/presentation/creative_writing.dart';
import 'package:awoke_learning_app/features/courses/presentation/interview_preparation.dart';
import 'package:awoke_learning_app/features/courses/presentation/personality_development.dart';
import 'package:awoke_learning_app/features/courses/presentation/public_speaking.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:awoke_learning_app/features/Razorpay/presentation/screens/course_buy_details.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  
  '/': (context) => OnBoardingScreen(), // Route for the OnBoardingScreen
  '/signup': (context) => const AuthPage(), // Route for the SignUpPage
  '/loginpage': (context) => Loginpage(),
  '/otppage': (context) => const OtpPage(),
  '/userdatapage': (context) => const UserDataPage(),
  '/homepage': (context) => const ScreenHome(),
  '/kgpage': (context) => const KgPage(),
  '/kidspage': (context) => const KidsPage(),
  '/schoolteenspage': (context) => const SchoolTeensPage(),
  '/grownupspage': (context) => const GrownupsPage(),
  '/veteranspage': (context) => const VeteransPage(),
  '/creativewriting': (context) => const Creativewriting(),
  '/publicspeaking': (context) => const PublicSpeaking(),
  '/personalitydevelopment': (context) => const PersonalityDevelopment(),
  '/interviewpreparation': (context) => const InterviewPreparation(),
  '/coursedetails': (context) => const CoursePage(),
};
