import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/common/custom_scaffold.dart';
import 'package:tiktok_clone/features/authentication/widgets/custom_form_button.dart';
import 'package:tiktok_clone/features/onboarding/screens/interests.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Log In',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Gaps.v28,
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                return null;
              },
              onSaved: (newValue) {},
            ),
            Gaps.v16,
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  return;
                }
              },
            ),
            Gaps.v28,
            GestureDetector(
              onTap: _onSubmitTap,
              child: CustomFormButton(
                disabled: false,
                abledColor: Colors.amber.shade500,
              ),
            ),
          ],
        ),
      ),
      bottomAppBar: const BottomAppBar(),
    );
  }
}
