import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CenterColoredButton(
          right: 20,
          color: Color(0xff61D4F0),
        ),
        CenterColoredButton(
          left: 20,
          color: Theme.of(context).primaryColor,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
          ),
          height: 30,
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class CenterColoredButton extends StatelessWidget {
  final Color color;
  final double? left;
  final double? right;
  const CenterColoredButton({
    super.key,
    required this.color,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      child: Container(
        height: 30,
        width: 25,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            Sizes.size8,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size8,
        ),
      ),
    );
  }
}
