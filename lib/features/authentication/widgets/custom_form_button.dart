import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class CustomFormButton extends StatelessWidget {
  final bool disabled;
  final String? text;
  final Color? abledColor;

  const CustomFormButton({
    super.key,
    this.abledColor,
    this.text,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: disabled
              ? isDarkMode(context)
                  ? Colors.grey.shade800
                  : Colors.grey.shade300
              : Colors.white, // 사용 가능할 시 배경색
        ),
        duration: const Duration(milliseconds: 300),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.white : Theme.of(context).primaryColor, // 배경색
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            text ?? "Next",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
