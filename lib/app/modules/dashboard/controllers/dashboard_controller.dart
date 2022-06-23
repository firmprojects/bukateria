import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  PersistentTabController persistentTabController = PersistentTabController();
  bool? hideNavBar;

  BuildContext? menuScreenContext;

  @override
  void onInit() {
    super.onInit();
    persistentTabController = PersistentTabController(initialIndex: 0);
    hideNavBar = false;
  }


}
