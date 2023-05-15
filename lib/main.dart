import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFFe9435A),
      ),
      home: const SignUpScreen(),
      // Scaffold에 Text 관련 주요 설정들이 있어서 Scaffold가 없으면 다 깨질 수 있음.
    );
  }
}
