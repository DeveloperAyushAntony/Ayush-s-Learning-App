import 'package:awoke_learning_app/features/auth/data/datasources/google_sign_in_data_source.dart';
import 'package:awoke_learning_app/features/auth/data/datasources/hive_login_state_data_source.dart'; // Import the new DataSource
import 'package:awoke_learning_app/features/auth/data/models/login_state.dart';
import 'package:awoke_learning_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:awoke_learning_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:awoke_learning_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  try {
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
    if (supabaseUrl == null || supabaseAnonKey == null) {
      throw Exception('Supabase environment variables are not set.');
    }

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
    getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);

    await Hive.initFlutter();
    Hive.registerAdapter(LoginStateAdapter());

    final loginBox = await Hive.openBox<LoginState>('loginState');
    getIt.registerSingleton<Box<LoginState>>(loginBox);

    getIt.registerSingleton(HiveLoginStateDataSource(getIt<Box<LoginState>>()));

    getIt.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(getIt<SupabaseClient>()),
    );

    getIt.registerSingleton(SignInWithGoogle(getIt<AuthRepository>()));

    getIt.registerSingleton(GoogleSignInDataSource(getIt<SupabaseClient>()));

    getIt.registerSingleton(AuthProvider(
        getIt<SignInWithGoogle>(), getIt<HiveLoginStateDataSource>()));
  } catch (e) {
    print('Error configuring dependencies: $e');
  }
}
