import 'package:bukateria/app/modules/account/views/account_view.dart';
import 'package:bukateria/app/modules/home/views/home_view.dart';
import 'package:bukateria/app/modules/menus/views/menus_view.dart';
import 'package:bukateria/app/modules/notifications/views/notifications_view.dart';
import 'package:bukateria/app/modules/orders/views/orders_view.dart';
import 'package:bukateria/app/modules/payment/views/payment_success_view.dart';
import 'package:bukateria/app/modules/payment/views/payment_view.dart';
import 'package:bukateria/app/modules/profiles/views/profiles_view.dart';
import 'package:bukateria/app/modules/recipes/views/create_recipe_view.dart';
import 'package:bukateria/app/modules/recipes/views/recipes_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/dashboard_controller.dart';

class VendorDashboard extends StatefulWidget {
  VendorDashboard({Key? key}) : super(key: key);

  @override
  State<VendorDashboard> createState() => _VendorDashboardState();
}

class _VendorDashboardState extends State<VendorDashboard> {
  final screens = [
    ProfilesView(),
    NotificationsView(),
    AddRecipeWidget(),
    OrdersView(),
    // AccountPageWidget()
    PaymentWidget()
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Home",
                      icon: Icons.home,
                      selected: true,
                      onPressed: () {
                        setState(() {
                          curentIndex = 0;
                        });
                      }),
                  IconBottomBar(
                      text: "Notifications",
                      icon: Icons.notifications_outlined,
                      selected: false,
                      onPressed: () {
                        setState(() {
                          curentIndex = 1;
                        });
                      }),
                  IconBottomBar(
                      text: "Create",
                      icon: Icons.add_outlined,
                      selected: false,
                      onPressed: () {
                        setState(() {
                          curentIndex = 2;
                        });
                      }),
                  IconBottomBar(
                      text: "Orders",
                      icon: Icons.shopping_cart_outlined,
                      selected: false,
                      onPressed: () {
                        setState(() {
                          curentIndex = 3;
                        });
                      }),
                  IconBottomBar(
                      text: "Account",
                      icon: Icons.person_outline,
                      selected: false,
                      onPressed: () {
                        setState(() {
                          curentIndex = 4;
                        });
                      })
                ],
              ),
            ),
          ),
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primary : dark,
          ),
        ),
        Text(text,
            style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? primary : dark,
            ))
      ],
    );
  }
}
