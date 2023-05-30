import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Activity'),
      ),
      body: ListView(
        children: [
          Gaps.v12,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            child: Text(
              'New',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: Sizes.size14,
              ),
            ),
          ),
          Gaps.v12,
          Dismissible(
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                child: FaIcon(
                  FontAwesomeIcons.checkDouble,
                  color: Colors.white,
                  size: Sizes.size24,
                ),
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.only(
                  right: Sizes.size10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.white,
                  size: Sizes.size24,
                ),
              ),
            ),
            key: const Key("x"),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: Sizes.size1,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                width: Sizes.size52,
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.bell,
                    color: Colors.black,
                  ),
                ),
              ),
              title: RichText(
                text: TextSpan(
                  text: "Account updates:",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: Sizes.size16,
                  ),
                  children: [
                    const TextSpan(
                      text: ' Upload longer videos',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '1h',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: const FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
