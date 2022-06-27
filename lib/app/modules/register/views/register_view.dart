import 'package:bukateria/app/modules/login/views/login_view.dart';
import 'package:bukateria/app/modules/otp/views/otp_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Create Your Account",
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
                hintText: "Full Name",
                labelText: "Full Name",
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person,
                borderRadius: 10,
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
              const CustomInput(
                height: 70,
                hintText: "Confirm Password",
                labelText: "Confirm Password",
                keyboardType: TextInputType.text,
                isPassword: true,
                prefixIcon: Icons.lock,
                borderRadius: 10,
              ),
              CustomButton(
                  width: Get.width,
                  radius: 30,
                  height: 50,
                  text: "Register",
                  color: primary,
                  onPressed: () => Get.to(() => OtpView())),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => Get.to(() => LoginView()),
                child: Text(
                  "Already have an account? login",
                  style: body3,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
