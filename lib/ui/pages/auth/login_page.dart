import 'package:auth_project/cubit/auth_cubit/auth_cubit.dart';
import 'package:auth_project/ui/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _textEditingEmailController;
  late TextEditingController _textEditingPasswordController;

  @override
  void initState() {
    _textEditingEmailController = TextEditingController();
    _textEditingPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Введите email"),
              controller: _textEditingEmailController,
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Введите пароль"),
              controller: _textEditingPasswordController,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).signInUser(
                      _textEditingEmailController.text,
                      _textEditingPasswordController.text,
                    );
                  },
                  child: const Text("Войти"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                  child: const Text("Зарегистрироваться"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
