import 'package:bukateria/app/modules/notifications/views/notifications_view.dart';
import 'package:bukateria/data/menu_items.dart';
import 'package:bukateria/models/menu_item_model.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_dialog.dart';
import 'package:bukateria/widgets/pop_menu.dart';
import 'package:bukateria/widgets/profile_menu_list.dart';
import 'package:bukateria/widgets/tab_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profiles_controller.dart';

class ProfilesView extends StatelessWidget {
  ProfilesView({Key? key}) : super(key: key);
  ProfilesController controller = Get.put(ProfilesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: dark),
        automaticallyImplyLeading: true,
        actions: [
          PopMenu(),
          SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: white,
      body: Container(
        height: Get.height,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/person.png',
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Yusuf Musa',
              textAlign: TextAlign.center,
              style: title3,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '32',
                        style: title3,
                      ),
                      Text(
                        'Recipies',
                        style: body3,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '43',
                        style: title3,
                      ),
                      Text(
                        'Menus',
                        style: body3,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '800',
                        style: title3,
                      ),
                      Text(
                        'Followers',
                        style: body3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                  radius: 30,
                  height: 40,
                  onPressed: () {},
                  color: primary,
                  width: Get.width,
                  text: "Follow"),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabButton(
                      text: "Menus",
                      pageNum: 0,
                      selectedpage: controller.selectedPage.value,
                      onPressed: () {
                        controller.getPage(0);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TabButton(
                      text: "Recipe",
                      pageNum: 1,
                      selectedpage: controller.selectedPage.value,
                      onPressed: () {
                        controller.getPage(1);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: PageView(
                onPageChanged: (int page) {
                  controller.selectedPage.value = page;
                },
                controller: controller.pagecontroller,
                children: [
                  ProfileMenusList(),
                  Center(
                    child: Text("Page2"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
