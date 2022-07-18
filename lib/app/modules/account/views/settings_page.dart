import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const notification_key = 'notification-key';

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Settings",
      subtitle: "Notifications",
      leading: Icon(Icons.settings),
      onTap: () {},
      child: SettingsScreen(title: "Settings", children: [
        SizedBox(
          height: 15,
        ),
        buildNotification(context),
        SizedBox(
          height: 15,
        ),
      ]),
    );
  }

  Widget buildNotification(context) => SwitchSettingsTile(
        title: "Notification",
        settingKey: notification_key,
        subtitle: "",
        leading: Icon(Icons.notifications),
        onChange: (val) {},
      );
}
