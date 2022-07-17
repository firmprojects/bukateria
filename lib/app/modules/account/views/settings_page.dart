import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const phoneKey = 'phone-key';
  static const nameKey = 'name-key';

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Settings",
      subtitle: "Password, Name, Phone",
      leading: Icon(Icons.settings),
      onTap: () {},
      child: SettingsScreen(title: "Edit Profile", children: [
        SizedBox(
          height: 15,
        ),
        buildUpdatePassword(context),
        SizedBox(
          height: 15,
        ),
        buildUpdatePhone(context),
        SizedBox(
          height: 15,
        ),
        buildUpdateName(context),
      ]),
    );
  }

  Widget buildUpdatePassword(context) => SimpleSettingsTile(
        title: "Terms & Conditions",
        subtitle: "",
        leading: Icon(Icons.document_scanner),
        onTap: () {},
      );

  Widget buildUpdatePhone(context) => TextInputSettingsTile(
        title: "Update Phone",
        settingKey: phoneKey,
        onChange: (phone) {},
      );

  Widget buildUpdateName(context) => TextInputSettingsTile(
        title: "Update Name",
        settingKey: nameKey,
        initialValue: "Kayode Wole",
        onChange: (name) {/* NOOP*/},
      );
}
