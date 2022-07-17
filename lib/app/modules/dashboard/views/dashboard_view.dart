import 'package:bukateria/app/modules/account/views/account_view.dart';
import 'package:bukateria/app/modules/favourites/views/favourites_view.dart';
import 'package:bukateria/app/modules/home/views/home_view.dart';
import 'package:bukateria/app/modules/menus/views/menus_view.dart';
import 'package:bukateria/app/modules/notifications/views/notifications_view.dart';
import 'package:bukateria/app/modules/orders/views/orders_view.dart';
import 'package:bukateria/app/modules/profiles/views/profiles_view.dart';
import 'package:bukateria/app/modules/recipes/views/create_recipe_view.dart';
import 'package:bukateria/app/modules/recipes/views/recipes_view.dart';
import 'package:bukateria/app/modules/vlog/views/vlog_view.dart';
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
    VlogView(),
    FavouritesView(),
    AccountPageWidget()

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
                label: "Menu"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.food_bank,
                ),
                label: "Recipies"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_outlined,
                ),
                label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Account"),
          ],
        ));
  }
}
