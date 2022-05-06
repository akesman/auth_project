import 'package:auth_project/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase/supabase.dart';


class GoodAuth extends StatelessWidget {
  final User user;

  const GoodAuth(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Вы вошли"),
          const SizedBox(height: 8),
          Text("email: ${user.email} "),
          const SizedBox(height: 8),
          Text("id: ${user.id}"),
          const SizedBox(height: 8),
          Image.asset(
            'assets/good_pic.png',
            fit: BoxFit.contain,
          ),
          ElevatedButton(
            onPressed: () async {
              BlocProvider.of<AuthCubit>(context).logout();
            },
            child: const Text("Выйти"),
          ),
        ],
      ),
    );
  }
}
