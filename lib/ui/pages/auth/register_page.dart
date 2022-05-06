import 'package:auth_project/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _textEditingEmailController;
  late TextEditingController _textEditingPasswordController;
  late TextEditingController _textEditingRePasswordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textEditingEmailController = TextEditingController();
    _textEditingPasswordController = TextEditingController();
    _textEditingRePasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите текст';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Введите email"),
                controller: _textEditingEmailController,
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите текст';
                  }
                  if (value.length < 6) {
                    return 'Короткий пароль';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Введите пароль"),
                controller: _textEditingPasswordController,
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите текст';
                  }
                  if (value != _textEditingPasswordController.text) {
                    return 'Пороли не совпадают';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Повторите пароль",
                ),
                controller: _textEditingRePasswordController,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).signUpUser(
                            _textEditingEmailController.text,
                            _textEditingPasswordController.text);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Зарегистрироваться"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Назад"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
