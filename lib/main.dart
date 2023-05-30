import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/screens/activity.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade50,
          ),
          highlightColor: Colors.transparent,
          primaryColor: const Color(0xFFe9435A),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          disabledColor: Colors.grey.shade400,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFe9435A),
          )),
      home: const ActivityScreen(),
      // Scaffold에 Text 관련 주요 설정들이 있어서 Scaffold가 없으면 다 깨질 수 있음.
    );
  }
}
