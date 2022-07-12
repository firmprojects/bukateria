import 'package:bukateria/app/modules/menus/views/create_menu_view.dart';
import 'package:bukateria/app/modules/pages/holder.dart';
import 'package:bukateria/app/modules/recipes/views/create_recipe_view.dart';
import 'package:bukateria/app/modules/vlog/views/add_vlog_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CreateView extends StatelessWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/cooking.png",
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Create something interesting",
                style: title3,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "Share your knowledge, inspire others",
                style: body4,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      radius: 10,
                      color: dark,
                      height: 35,
                      onPressed: () {
                        Get.to(() => AddMenu());
                      },
                      width: 90,
                      text: "menu"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      radius: 10,
                      color: dark,
                      height: 35,
                      onPressed: () {
                        Get.to(() => AddRecipe());
                      },
                      width: 90,
                      text: "Recipe"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      radius: 10,
                      color: dark,
                      height: 35,
                      onPressed: () {
                        Get.to(() => AddVlog());
                      },
                      width: 90,
                      text: "Explore"),
                ],
              )
            ],
          ),
        ),
        Container()
      ],
    );
  }
}
