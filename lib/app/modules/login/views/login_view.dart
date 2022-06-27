import 'package:bukateria/app/modules/dashboard/views/dashboard_view.dart';
import 'package:bukateria/app/modules/dashboard/views/vendor_dashboard.dart';
import 'package:bukateria/app/modules/register/views/register_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
            Text(
              "Sign In",
              style: title3,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
              child: Image.asset(
                'assets/images/Bukkateria_Logomark_Colour.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const CustomInput(
              height: 70,
              hintText: "Email",
              labelText: "Email",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              borderRadius: 10,
            ),
            const CustomInput(
              height: 70,
              hintText: "Password",
              labelText: "Password",
              keyboardType: TextInputType.text,
              isPassword: true,
              prefixIcon: Icons.lock,
              borderRadius: 10,
            ),
            CustomButton(
              width: Get.width,
              radius: 30,
              height: 50,
              text: "Sign In",
              color: primary,
              onPressed: () => Get.to(() => VendorDashboard()),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => Get.to(() => RegisterView()),
              child: Text(
                "Don't have an account yet? signup",
                style: body3,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
