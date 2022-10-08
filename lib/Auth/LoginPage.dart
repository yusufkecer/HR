import 'package:chat/Auth/RegisterPage.dart';
import 'package:chat/Widgets/Form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> users = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Giriş Yap",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                  child: Column(
                children: [
                  TextFields("İsim", users),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFields("Şifre", users),
                ],
              )),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Kaydol"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(users.length);
                  },
                  child: const Text("abc"))
            ],
          ),
        ),
      ),
    );
  }
}
