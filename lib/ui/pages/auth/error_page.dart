import 'package:auth_project/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorPage extends StatelessWidget {
  final String errorLog;

  const ErrorPage(this.errorLog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(errorLog),
            const SizedBox(height: 8),
            Image.asset(
              'assets/error_pic.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AuthCubit>(context).openLoginScreen();
              },
              child: const Text("Выйти"),
            ),
          ],
        ),
      ),
    );
  }
}
