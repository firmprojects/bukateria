import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';

import '../../../../common_views.dart';
import '../../../../cubit/account_cubit/account_cubit.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(listener: (context,state){
      print("-----------------${state.status}");
      if(state.status == AccountStatus.updateSuccess){
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully updated!")));
      }else if(state.status == AccountStatus.updateSubmitting){
        CommonViews.showProgressDialog(context);
      }else if (state.status == AccountStatus.error){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong!")));
      }else if (state.status == AccountStatus.missingField){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter something!")));
      }
    },child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state)
    {
      return SimpleSettingsTile(
        title: "Edit Profile",
        subtitle: "Name, Password",
        leading: Icon(Icons.person),
        onTap: () {},
        child: SettingsScreen(title: "Edit Profile", children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (val) => context.read<AccountCubit>().nameChanged(val),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Name',
                      hintStyle: body3,
                      labelStyle: body3,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E5E5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E5E5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: greyLight.withOpacity(0.2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (val)  => context.read<AccountCubit>().passwordChanged(val),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      hintStyle: body3,
                      labelStyle: body3,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E5E5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E5E5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: greyLight.withOpacity(0.2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  width: Get.width,
                  radius: 30,
                  height: 50,
                  text: "Update Profile",
                  color: dark,
                  onPressed: () => {
                     context.read<AccountCubit>().updatePasswordOrName()
                  },
                ),
              ],
            ),
          ),
        ]),
      );
    }),
    );
    
  }

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
