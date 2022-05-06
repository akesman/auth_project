import 'package:auth_project/cubit/auth_cubit/auth_cubit.dart';
import 'package:auth_project/data/api/auth_api.dart';
import 'package:auth_project/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'data/api/database_api.dart';
import 'ui/pages/home_page.dart';

Future<void> main() async {
  DatabaseApi _databaseApi = DatabaseApi();

  AuthService authService = AuthService(AuthApi(_databaseApi));

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (context) => authService),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(context),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
