import 'package:bukateria/app/modules/dashboard/views/dashboard_view.dart';
import 'package:bukateria/app/modules/dashboard/views/vendor_dashboard.dart';
import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/recipe_card.dart';
import 'package:bukateria/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

import '../controllers/recipes_controller.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({Key? key}) : super(key: key);

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  final _controller = ValueNotifier<bool>(false);

  bool _checked = false;

  void switchRole() {
    if (_checked == true) {
      Get.to(() => VendorDashboard());
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
        elevation: 0,
        toolbarHeight: 130,
        backgroundColor: primary,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ikeja, Lagos",
                      style: body3.copyWith(color: white),
                    ),
                    AdvancedSwitch(
                      controller: _controller,
                      activeColor: green,
                      inactiveColor: dark,
                      activeChild: Text('Chef'),
                      inactiveChild: Text('Chef'),
                      borderRadius: BorderRadius.all(const Radius.circular(15)),
                      width: 60.0,
                      height: 20.0,
                      enabled: true,
                      disabledOpacity: 0.5,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                showSearch(context: context, delegate: MenuSearchDelegate())
              },
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: dark,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Search menus",
                        style: body3,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: recipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.6,
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return RecipeCard(recipes: recipes, index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
