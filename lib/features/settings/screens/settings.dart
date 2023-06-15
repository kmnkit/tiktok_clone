import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        children: [
          // CupertinoSwitch(
          //   value: _notifications,
          //   onChanged: _onNotificationChanged,
          // ),
          SwitchListTile.adaptive(
              value: _notifications,
              onChanged: _onNotificationChanged,
              title: const Text("Enable Notifications")),
          // Checkbox(
          //   value: _notifications,
          //   onChanged: _onNotificationChanged,
          // ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text(
              "Enable Notifications",
            ),
          ),
          ListTile(
            onTap: () async {
              // final date = await showDatePicker(
              //   context: context,
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(1989),
              //   lastDate: DateTime(2030),
              // );
              // print(date);
              // final time = await showTimePicker(
              //   context: context,
              //   initialTime: TimeOfDay.now(),
              // );
              // print(time);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(
                  DateTime.now().year,
                ),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text(
              "When is your Birthday?",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
