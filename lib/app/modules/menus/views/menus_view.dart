import 'package:bukateria/widgets/menu_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {
  const MenusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoSearchTextField(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  borderRadius: BorderRadius.circular(30),
                  prefixInsets: EdgeInsets.only(left: 15)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return MenuCardComponentWidget();
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
