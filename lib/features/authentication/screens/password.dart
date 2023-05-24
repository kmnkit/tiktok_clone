import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/common/custom_scaffold.dart';
import 'package:tiktok_clone/features/authentication/screens/birthday.dart';
import 'package:tiktok_clone/features/authentication/widgets/custom_form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obsequreText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose(); // 모든 것 뒤에 super.dispose 하는 것이 가장 적절하다고 함 by Nico
  }

  bool _isPasswordValid() =>
      _password.isNotEmpty && _password.length >= 8 && _password.length <= 20;

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: CustomScaffold(
        title: "Sign Up",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "Password",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _passwordController,
              obscureText: _obsequreText,
              autocorrect: false,
              cursorColor: Theme.of(context).primaryColor,
              onEditingComplete: _onSubmit,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _onClearTap,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Theme.of(context).primaryColor,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.h12,
                    GestureDetector(
                      onTap: _toggleObsecureText,
                      child: FaIcon(
                        _obsequreText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Theme.of(context).primaryColor,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                hintText: "Make it strong!",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Gaps.v10,
            const Text(
              "Your password must have:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size20,
                  color: _isPasswordValid()
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade400,
                ),
                Gaps.h5,
                const Text('8 to 20 characters')
              ],
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onSubmit,
              child: CustomFormButton(
                disabled: !_isPasswordValid(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onScaffoldTap() => FocusScope.of(context).unfocus();

  void _onClearTap() => _passwordController.clear();

  void _toggleObsecureText() {
    _obsequreText = !_obsequreText;
    setState(() {});
  }
}
