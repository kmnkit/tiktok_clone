import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/common/custom_scaffold.dart';
import 'package:tiktok_clone/features/authentication/screens/login.dart';
import 'package:tiktok_clone/features/authentication/screens/username.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return CustomScaffold(
          body: SafeArea(
            child: Column(
              children: [
                Gaps.v80,
                const Text(
                  'Sign up for TikTok',
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: isDarkMode(context) ? Colors.grey.shade300 : Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gaps.v40,
                if (orientation == Orientation.portrait) ...[
                  AuthButton(
                    func: _onEmailTap,
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                    ),
                    text: "Use email & password",
                  ),
                  Gaps.v16,
                  AuthButton(
                    func: (context) {},
                    icon: const FaIcon(
                      FontAwesomeIcons.apple,
                    ),
                    text: "Continue with Apple",
                  )
                ],
                if (orientation == Orientation.landscape)
                  Row(
                    children: [
                      Expanded(
                        child: AuthButton(
                          func: _onEmailTap,
                          icon: const FaIcon(
                            FontAwesomeIcons.user,
                          ),
                          text: "Use email & password",
                        ),
                      ),
                      Gaps.h16,
                      Expanded(
                        child: AuthButton(
                          func: (context) {},
                          icon: const FaIcon(
                            FontAwesomeIcons.apple,
                          ),
                          text: "Continue with Apple",
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
          bottomAppBar: BottomAppBar(
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
