import 'package:awoke_learning_app/features/auth/data/models/login_state.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:awoke_learning_app/features/gemini/domain/usecases/send_message_usecase.dart';
import 'package:awoke_learning_app/features/gemini/provider/gemini_provider.dart';
import 'package:awoke_learning_app/features/mockclasses/provider/youtube_provider.dart';
import 'package:awoke_learning_app/features/bottomnavigation/providers/bottomnav_index_provider.dart';
import 'package:awoke_learning_app/features/payments/presentation/providers/courseprovider.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/phone_number_provider.dart';
import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

import 'core/di/service_locator.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: "lib/.env");
  await configureDependencies();

  final Box<LoginState> loginBox = GetIt.instance.get<Box<LoginState>>();
  final bool isLoggedIn = loginBox.get('loginState')?.accessToken != null;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(isLoggedIn: isLoggedIn));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<YouTubeProvider>()..fetchVideos(),
        ),
        ChangeNotifierProvider(create: (_) => BottomNavIndexProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()),
        ChangeNotifierProvider(create: (_) => PhoneNumberProvider()),
        ChangeNotifierProvider(
          create: (_) => GeminiProvider(
            GetIt.instance<SendMessageUseCase>(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => GetIt.instance<AuthProvider>()),
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
