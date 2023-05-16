import 'package:flutter/material.dart';
import 'package:tiktok_clone/custom_scaffold.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Log In',
      body: SizedBox(
        width: 200,
      ),
      bottomAppBar: BottomAppBar(),
    );
  }
}
