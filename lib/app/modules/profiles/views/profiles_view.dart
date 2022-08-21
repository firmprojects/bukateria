import 'package:bukateria/app/modules/account/views/account_view.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

import '../../../../cubit/post_cubit/post_cubit.dart';
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
      Get.to(() => const AccountView());
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
    return BlocListener<PostCubit, PostState>(
      listener: (context, state) {},
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return StreamBuilder<DocumentSnapshot>(
              stream: context.read<PostCubit>().getSpecificUser(
                  FirebaseAuth.instance.currentUser?.uid ?? ""),
              builder: (context, snap) {
                if (snap.hasData) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: white,
                      iconTheme: const IconThemeData(color: dark),
                      automaticallyImplyLeading: true,
                      actions: [
                        PopMenu(),
                        const SizedBox(
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                    child: Container(
                                        width: 120,
                                        height: 120,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child:
                                            (snap.data?["image"].toString() ??
                                                        "")
                                                    .isEmpty
                                                ? Image.asset(
                                                    'assets/images/square.jpg',
                                                    fit: BoxFit.fill,
                                                  )
                                                : CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                        "${snap.data!["image"].toString()}",
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  )),
                                  ),
                                ],
                              ),
                              Text(
                                snap.data?["name"].toString() ?? "",
                                textAlign: TextAlign.center,
                                style: title3,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    StreamBuilder<QuerySnapshot>(
                                        stream: context
                                            .read<PostCubit>()
                                            .getRecipes(),
                                        builder: (context, snapshot) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                "${snapshot.data?.docs.length ?? 0}",
                                                style: title3,
                                              ),
                                              Text(
                                                'Recipies',
                                                style: body3,
                                              ),
                                            ],
                                          );
                                        }),
                                    StreamBuilder<QuerySnapshot>(
                                        stream: context
                                            .read<PostCubit>()
                                            .getMenus(),
                                        builder: (context, snapshot) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                "${snapshot.data?.docs.length ?? 0}",
                                                style: title3,
                                              ),
                                              Text(
                                                'Menus',
                                                style: body3,
                                              ),
                                            ],
                                          );
                                        }),
                                    StreamBuilder<QuerySnapshot>(
                                        stream: context
                                            .read<PostCubit>()
                                            .getRecipes(),
                                        builder: (context, snapshot) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '0',
                                                style: title3,
                                              ),
                                              Text(
                                                'Followers',
                                                style: body3,
                                              ),
                                            ],
                                          );
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TabButton(
                                        text: "Menus",
                                        pageNum: 0,
                                        selectedpage:
                                            controller.selectedPage.value,
                                        onPressed: () {
                                          controller.getPage(0);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      TabButton(
                                        text: "Recipe",
                                        pageNum: 1,
                                        selectedpage:
                                            controller.selectedPage.value,
                                        onPressed: () {
                                          controller.getPage(1);
                                        },
                                      ),
                                      TabButton(
                                        text: "Explore",
                                        pageNum: 2,
                                        selectedpage:
                                            controller.selectedPage.value,
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
                                    const ProfileMenusList(),
                                    const ProfileRecipeList(),
                                    const ProfileExploreList(),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("Loading, please wait... "),
                );
              });
        },
      ),
    );
  }
}
