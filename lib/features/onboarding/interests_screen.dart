import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/custom_scaffold.dart';

List<String> interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Choose your interests',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v32,
            const Text(
              'Choose your interests',
              style: TextStyle(
                fontSize: Sizes.size40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v20,
            const Text(
              'Get better video recommendations',
              style: TextStyle(
                fontSize: Sizes.size20,
              ),
            ),
            Gaps.v64,
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: [
                for (var interest in interests)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size8,
                      horizontal: Sizes.size24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Sizes.size32,
                      ),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(
                            0.05,
                          ),
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Text(
                      interest,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
