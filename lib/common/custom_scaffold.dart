import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final BottomAppBar? bottomAppBar;

  const CustomScaffold({
    super.key,
    this.bottomAppBar,
    this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: body,
      ),
      bottomNavigationBar: bottomAppBar,
    );
  }
}
