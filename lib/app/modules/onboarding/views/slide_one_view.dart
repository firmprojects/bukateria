import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/slide_bg_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/onboarding_controller.dart';

class SlideOneView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideBG(
          image: "assets/images/ck3.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 250,
                  left: 20,
                  child: Text("Over 5900 \nRecipes \nJust For You",
                      textAlign: TextAlign.left,
                      style: title1.copyWith(color: white, fontSize: 40))),
              Positioned(
                  bottom: 170,
                  left: 20,
                  child: Text(
                      "Bukataria make available to you \nthousands of recipes for African and \nContinental dishes for your delight",
                      style: body3.copyWith(color: white))),
            ],
          ),
        )
      ],
    );
  }
}
