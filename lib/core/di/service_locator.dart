import 'package:awoke_learning_app/core/services/agora_service.dart' show AgoraService;
import 'package:awoke_learning_app/features/agora/data/datasources/agoradatasource.dart';
import 'package:awoke_learning_app/features/agora/data/repositories/agora_repo_impl.dart';
import 'package:awoke_learning_app/features/agora/domain/repositories/agora_repo.dart';
import 'package:awoke_learning_app/features/agora/domain/usecases/agora_use_case.dart';
import 'package:awoke_learning_app/features/agora/presentation/providers/agora_provider.dart';
import 'package:awoke_learning_app/features/gemini/data/datasources/gemini_data_source.dart';
import 'package:awoke_learning_app/features/gemini/data/repositories/gemini_repository_impl.dart';
import 'package:awoke_learning_app/features/gemini/domain/repositories/gemini_repository.dart';
import 'package:awoke_learning_app/features/gemini/domain/usecases/send_message_usecase.dart';
import 'package:awoke_learning_app/features/mockclasses/data/datasources/youtube_data_source.dart';
import 'package:awoke_learning_app/features/mockclasses/data/repositories/youtube_repository_impl.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/repository/youtube_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/usecases/channel_video_usecase.dart';
import 'package:awoke_learning_app/features/mockclasses/provider/youtube_provider.dart';
import 'package:awoke_learning_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:awoke_learning_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:awoke_learning_app/features/auth/data/datasources/google_sign_in_data_source.dart';
import 'package:awoke_learning_app/features/auth/data/datasources/hive_login_state_data_source.dart';
import 'package:awoke_learning_app/features/auth/data/models/login_state.dart';
import 'package:awoke_learning_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/auth_provider.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  try {
    print('Loading environment variables...');
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
    final webClientId = dotenv.env['WEB_CLIENT_ID'];
    final apiKey = dotenv.env['YOUTUBE_API_KEY'];
    final googleApiKey = dotenv.env['GEMINI_API_KEY'];

    final appId = dotenv.env['AGORA_APP_ID'];

    if (supabaseUrl == null ||
        supabaseAnonKey == null ||
        webClientId == null ||
        apiKey == null ||
        googleApiKey == null ||
        appId == null) {
      throw Exception('One or more environment variables are null');
    }

    print('Initializing Supabase...');
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
    getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);

    print('Initializing Hive...');
    await Hive.initFlutter();
    Hive.registerAdapter(LoginStateAdapter());

    print('Opening Hive box for login state...');
    final loginBox = await Hive.openBox<LoginState>('loginState');
    if (loginBox.isOpen) {
      getIt.registerSingleton<Box<LoginState>>(loginBox);
      print('Hive box registered successfully.');
    } else {
      throw Exception('Failed to open Hive box for login state.');
    }

    print('Registering HiveLoginStateDataSource...');
    getIt.registerSingleton<HiveLoginStateDataSource>(
        HiveLoginStateDataSource(getIt<Box<LoginState>>()));

    final googleSignIn = GoogleSignIn(serverClientId: webClientId);
    getIt.registerSingleton<GoogleSignIn>(googleSignIn);

    getIt.registerSingleton<AuthRepository>(
        AuthRepositoryImpl(getIt<SupabaseClient>(), getIt<GoogleSignIn>()));

    getIt.registerSingleton(SignInWithGoogle(getIt<AuthRepository>()));
    getIt.registerSingleton(GoogleSignInDataSource(getIt<SupabaseClient>()));
    getIt.registerSingleton(AuthProvider(
      getIt<SignInWithGoogle>(),
      getIt<HiveLoginStateDataSource>(),
    ));

    print("Start registering YouTube singletons");
    getIt.registerSingleton<Dio>(Dio());

    getIt.registerLazySingleton<YouTubeRemoteDataSource>(
      () => YouTubeRemoteDataSourceImpl(),
    );
    print("Registered YouTube remote data source");

    getIt.registerLazySingleton<YoutubeRepository>(
      () => YoutubeRepositoryImpl(
          remoteDataSource: getIt<YouTubeRemoteDataSource>()),
    );
    print("Registered YouTube repo");

    getIt.registerLazySingleton<GetChannelVideos>(
      () => GetChannelVideos(getIt<YoutubeRepository>()),
    );
    print("Registered GetChannelVideos");

    getIt.registerLazySingleton<YouTubeProvider>(
      () => YouTubeProvider(getChannelVideos: getIt<GetChannelVideos>()),
    );
    print("Registered YouTube provider");

    print('Registering Google Generative AI and dependencies...');

    // Register GeminiRemoteDataSource
    getIt.registerLazySingleton<GeminiRemoteDataSource>(
      () => GeminiRemoteDataSource(
        dio: getIt<Dio>(),
        apiKey: googleApiKey,
      ),
    );

    // Register GeminiRepositoryImpl
    getIt.registerLazySingleton<GeminiRepository>(
      () => GeminiRepositoryImpl(getIt<GeminiRemoteDataSource>()),
    );

    // Register SendMessageUseCase
    getIt.registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(getIt<GeminiRepository>()),
    );
  getIt.registerLazySingleton<AgoraRemoteDataSource>(() => AgoraRemoteDataSource());
  getIt.registerLazySingleton<AgoraRepository>(() => AgoraRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GenerateAgoraTokenUseCase>(() => GenerateAgoraTokenUseCase(getIt()));
  getIt.registerLazySingleton<AgoraService>(() => AgoraService());
  getIt.registerFactory(() => AgoraProvider(getIt(), getIt()));

    print('Dependency configuration completed successfully');
  } catch (e) {
    print('Error configuring dependencies: $e');
  }
}
