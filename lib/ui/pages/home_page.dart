import 'package:auth_project/cubit/auth_cubit/auth_cubit.dart';
import 'package:auth_project/ui/pages/auth/error_page.dart';
import 'package:auth_project/ui/pages/good_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoginAuthScreenState) {
              if (state.message.isNotEmpty) {
                showSnackBar(state.message, context);
              }
              return const LoginPage();
            } else if (state is ErrorAuthScreenState) {
              return ErrorPage(state.errorLog);
            } else if (state is AuthenticatedState) {
              return GoodAuth(state.user);
            }
            return loadingIndicator();
          },
        ),
      ),
    );
  }

  void showSnackBar(String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  Widget loadingIndicator() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
