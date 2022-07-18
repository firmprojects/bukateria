import 'package:bukateria/app/modules/account/views/chef_settings.dart';
import 'package:bukateria/app/modules/dashboard/views/dashboard_view.dart';
import 'package:bukateria/app/modules/notifications/views/notifications_view.dart';
import 'package:bukateria/data/menu_items.dart';
import 'package:bukateria/models/menu_item_model.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_dialog.dart';
import 'package:bukateria/widgets/pop_menu.dart';
import 'package:bukateria/widgets/profile_explore_list.dart';
import 'package:bukateria/widgets/profile_menu_list.dart';
import 'package:bukateria/widgets/profile_recipe_list.dart';
import 'package:bukateria/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'package:get/get.dart';

import '../controllers/profiles_controller.dart';

class ProfilesView extends StatefulWidget {
  ProfilesView({Key? key}) : super(key: key);

  @override
  State<ProfilesView> createState() => _ProfilesViewState();
}

class _ProfilesViewState extends State<ProfilesView> {
  ProfilesController controller = Get.put(ProfilesController());

  final _controller = ValueNotifier<bool>(false);

  bool _checked = false;

  void switchRole() {
    if (_checked == true) {
      Get.to(() => ChefSettings());
    } else {
      Get.to(() => DashboardView());
    }
  }

// ...
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          _checked = true;
          switchRole();
        } else {
          _checked = false;
        }
      });
    });
  }

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
        elevation: 1,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
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
                        TabButton(
                          text: "Explore",
                          pageNum: 2,
                          selectedpage: controller.selectedPage.value,
                          onPressed: () {
                            controller.getPage(2);
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
                      ProfileRecipeList(),
                      ProfileExploreList(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
