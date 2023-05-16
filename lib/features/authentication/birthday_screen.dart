import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose(); // 모든 것 뒤에 super.dispose 하는 것이 가장 적절하다고 함 by Nico
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When is your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ),
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(
                disabled: false,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: initialDate,
          onDateTimeChanged: _setTextFieldDate,
        ),
      )),
    );
  }

  void _onNextTap() {
    // StatefulWidget 안의 State 안에 있으면 어디서든 context를 사용 가능하므로
    // 이 method는 Context 안 받아도 됨
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }
}

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

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
              ? Theme.of(context).disabledColor
              : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 300),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.white : Theme.of(context).disabledColor,
            fontWeight: FontWeight.w600,
          ),
          child: const Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
