import 'package:bukateria/app/modules/account/views/settings_page.dart';
import 'package:bukateria/flutter_flow/flutter_flow_icon_button.dart';
import 'package:bukateria/flutter_flow/flutter_flow_theme.dart';
import 'package:bukateria/flutter_flow/flutter_flow_widgets.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({Key? key}) : super(key: key);

  @override
  _AccountPageWidgetState createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  TextEditingController? myBioController;
  TextEditingController? yourNameController1;
  TextEditingController? yourNameController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    myBioController = TextEditingController();
    yourNameController1 = TextEditingController();
    yourNameController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(color: dark),
        actions: [],
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFDBE2E7),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Container(
                        width: 90,
                        height: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/square.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SettingsGroup(title: "", children: [
                  SettingsPage(),
                  SizedBox(
                    height: 15,
                  ),
                  buildChefSwitch(),
                  buildOrders(),
                  SizedBox(
                    height: 15,
                  ),
                  buildLogout(),
                  SizedBox(
                    height: 15,
                  ),
                  buildPrivacy(),
                  SizedBox(
                    height: 15,
                  ),
                  buildTOS(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildsettings() => SimpleSettingsTile(
        title: "Setting",
        subtitle: "",
        leading: Icon(Icons.settings),
        onTap: () {},
      );

  Widget buildEditProfile() => SimpleSettingsTile(
        title: "Edit Profile",
        subtitle: "",
        leading: Icon(Icons.person),
        onTap: () {},
      );

  Widget buildOrders() => SimpleSettingsTile(
        title: "Orders",
        subtitle: "",
        leading: Icon(Icons.food_bank),
        onTap: () {},
        child: Container(),
      );

  Widget buildChefSwitch() => SwitchSettingsTile(
        title: "Switch",
        settingKey: "chef-switch",
        subtitle: "",
        leading: Icon(Icons.switch_access_shortcut),
        onChange: (val) {},
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: "LogOut",
        subtitle: "",
        leading: Icon(Icons.logout),
        onTap: () {
          Settings.clearCache();
        },
      );

  Widget buildPrivacy() => SimpleSettingsTile(
        title: "Privacy",
        subtitle: "",
        leading: Icon(Icons.privacy_tip),
        onTap: () {},
      );

  Widget buildTOS() => SimpleSettingsTile(
        title: "Terms & Conditions",
        subtitle: "",
        leading: Icon(Icons.document_scanner),
        onTap: () {},
      );
}
