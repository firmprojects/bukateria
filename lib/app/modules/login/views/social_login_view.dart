import 'package:bukateria/app/modules/login/views/login_view.dart';
import 'package:bukateria/app/modules/login/views/role_view_view.dart';
import 'package:bukateria/app/modules/otp/views/otp_view.dart';
import 'package:bukateria/app/modules/register/views/social_register_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SocialLoginView extends StatelessWidget {
  const SocialLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
              child: Image.asset(
                'assets/images/Bukkateria_Logomark_Colour.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            CustomButton(
                width: Get.width,
                radius: 30,
                height: 50,
                text: "Sign In With Google",
                color: dark,
                onPressed: () => Get.to(() => RoleRedirectWidget())),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                width: Get.width,
                radius: 30,
                height: 50,
                text: "Sign In With Facebook",
                color: blue,
                onPressed: () => Get.to(() => RoleRedirectWidget())),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => Get.to(() => SocialRegisterView()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet ? ",
                    style: body3,
                  ),
                  Text(
                    "register",
                    style: body3.copyWith(color: primary),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
