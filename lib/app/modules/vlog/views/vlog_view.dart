import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/explore_card.dart';
import 'package:bukateria/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'package:get/get.dart';

import '../controllers/vlog_controller.dart';

class VlogView extends StatelessWidget {
  const VlogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: primary,
            title: Text("Explore", style: title3.copyWith(color: white))),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: menus.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ExploreCard(
                      menus: menus,
                      index: index,
                    );
                  }),
            ),
          ],
        ));
  }
}
