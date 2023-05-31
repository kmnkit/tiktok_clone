import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.pink.shade200,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/firework.jpeg",
              fit: BoxFit.cover,
            ),
            title: const Text(
              "Hello!",
            ),
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
          ),
          floating: true,
          stretch: true,
          pinned: true,
        ),
      ],
    );
  }
}
