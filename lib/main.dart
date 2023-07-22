import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      darkTheme: ThemeData(
        // typography는 Font랑 Color만 제공한다.
        useMaterial3: true,
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade900,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        primaryColor: const Color(0xFFe9435A),
        typography: Typography.material2021(
          platform: TargetPlatform.iOS,
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFe9435A),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.pink.shade600,
          unselectedLabelColor: Colors.grey.shade500,
        ),
        indicatorColor: Colors.white,
        listTileTheme: ListTileThemeData(
          iconColor: Colors.grey.shade800,
        ),
      ),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        typography: Typography.material2021(
          platform: TargetPlatform.iOS,
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.grey.shade900,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.black,
        ),
        highlightColor: Colors.transparent,
        primaryColor: const Color(0xFFe9435A),
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        disabledColor: Colors.grey.shade900,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFe9435A),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.grey.shade400,
        ),
        indicatorColor: Colors.black,
      ),
      home: const SignUpScreen(),
      // Scaffold에 Text 관련 주요 설정들이 있어서 Scaffold가 없으면 다 깨질 수 있음.
    );
  }
}
