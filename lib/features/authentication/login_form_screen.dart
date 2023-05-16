import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/custom_scaffold.dart';
import 'package:tiktok_clone/features/authentication/widgets/custom_form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Log In',
      body: Form(
        child: Column(
          children: [
            const TextField(),
            Gaps.v16,
            const TextField(),
            Gaps.v28,
            CustomFormButton(
              disabled: false,
              abledColor: Colors.amber.shade500,
            ),
          ],
        ),
      ),
      bottomAppBar: const BottomAppBar(),
    );
  }
}
