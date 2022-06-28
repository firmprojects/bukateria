import 'package:bukateria/app/modules/home/views/home_view.dart';
import 'package:bukateria/app/modules/menus/views/menus_view.dart';
import 'package:bukateria/app/modules/notifications/views/notifications_view.dart';
import 'package:bukateria/app/modules/orders/views/orders_view.dart';
import 'package:bukateria/app/modules/profiles/views/profiles_view.dart';
import 'package:bukateria/app/modules/recipes/views/create_recipe_view.dart';
import 'package:bukateria/app/modules/recipes/views/recipes_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final screens = [
    MenusView(),
    RecipesView(),
    OrdersView(),
    NotificationsView(),

    //AccountView()
  ];

  var curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: curentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primary,
          unselectedItemColor: dark,
          iconSize: 30,
          currentIndex: curentIndex,
          onTap: (index) => setState(() => curentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.food_bank,
                ),
                label: "Recipies"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "My Orders"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: "Notifications"),
          ],
        ));
  }
}
