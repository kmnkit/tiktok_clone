import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/common/custom_scaffold.dart';
import 'package:tiktok_clone/features/authentication/widgets/custom_form_button.dart';
import 'package:tiktok_clone/features/onboarding/screens/interests.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime maximumDate = DateTime(
    DateTime.now().year - 15,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(maximumDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose(); // 모든 것 뒤에 super.dispose 하는 것이 가장 적절하다고 함 by Nico
  }

  void _onNextTap() {
    // StatefulWidget 안의 State 안에 있으면 어디서든 context를 사용 가능하므로
    // 이 method는 Context 안 받아도 됨
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Sign Up",
      body: Column(
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
            child: CustomFormButton(
              abledColor: Theme.of(context).primaryColor,
              disabled: false,
              text: "Next",
            ),
          ),
        ],
      ),
      bottomAppBar: BottomAppBar(
          child: SizedBox(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: maximumDate,
          maximumDate: maximumDate,
          maximumYear: maximumDate.year,
          onDateTimeChanged: _setTextFieldDate,
        ),
      )),
    );
  }
}
