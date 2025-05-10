import 'package:awoke_learning_app/features/agora/presentation/providers/agora_provider.dart';
import 'package:awoke_learning_app/features/auth_google/data/models/login_state.dart';
import 'package:awoke_learning_app/features/auth_google/presentation/providers/auth_provider.dart';
import 'package:awoke_learning_app/features/auth_otp/domain/usecases/send_otp_usecase.dart';
import 'package:awoke_learning_app/features/auth_otp/domain/usecases/verify_otp_usecase.dart';
import 'package:awoke_learning_app/features/auth_otp/presentation/providers/phone_auth_provider.dart';
import 'package:awoke_learning_app/features/auth_otp/presentation/screens/screen/loginpage.dart';
import 'package:awoke_learning_app/features/gemini/domain/usecases/send_message_usecase.dart';
import 'package:awoke_learning_app/features/gemini/provider/gemini_provider.dart';
import 'package:awoke_learning_app/features/mockclasses/provider/youtube_provider.dart';
import 'package:awoke_learning_app/features/bottomnavigation/providers/bottomnav_index_provider.dart';
import 'package:awoke_learning_app/features/Razorpay/presentation/providers/courseprovider.dart';
import 'package:awoke_learning_app/features/auth_otp/presentation/providers/phone_number_provider.dart';
import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';
import 'core/di/service_locator.dart';

/// Request Camera & Microphone Permissions
Future<void> requestPermissions() async {
  final statuses = await [
    Permission.camera,
    Permission.microphone,
    Permission.manageExternalStorage,
  ].request();

  if (statuses[Permission.camera]!.isDenied ||
      statuses[Permission.microphone]!.isDenied) {
    debugPrint("❌ Camera & Microphone permissions are required.");
  }
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: "lib/.env");

  // Initialize dependencies
  await configureDependencies();

  await requestPermissions();

  // Only access Hive box *after* dependencies are registered
  final loginBox = GetIt.instance<Box<LoginState>>();
  final isLoggedIn = loginBox.get('loginState')?.accessToken != null;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(AwokeLearningApp(isLoggedIn: isLoggedIn));
  FlutterNativeSplash.remove();
}

class AwokeLearningApp extends StatelessWidget {
  final bool isLoggedIn;

  const AwokeLearningApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GetIt.instance<YouTubeProvider>()..fetchVideos()),
        ChangeNotifierProvider(create: (_) => BottomNavIndexProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()),
        ChangeNotifierProvider(create: (_) => PhoneNumberProvider()),
        ChangeNotifierProvider(
          create: (_) => GeminiProvider(GetIt.instance<SendMessageUseCase>()),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<PhoneAuthProvider>(),
          child: Loginpage(),
        ),
        ChangeNotifierProvider(create: (_) => GetIt.instance<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<AgoraProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awoke Learning App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kblueColor),
          useMaterial3: false,
        ),
        initialRoute: isLoggedIn ? '/homepage' : '/',
        routes: appRoutes,
        onGenerateRoute: (settings) {
          final routeBuilder = appRoutes[settings.name];
          if (routeBuilder != null) {
            return MaterialPageRoute(builder: routeBuilder);
          }
          return null;
        },
      ),
    );
  }
}
