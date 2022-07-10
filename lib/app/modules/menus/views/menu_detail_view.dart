import 'package:auto_size_text/auto_size_text.dart';
import 'package:bukateria/app/modules/payment/views/payment_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:bukateria/widgets/ingredientItem.dart';
import 'package:bukateria/widgets/method_widget.dart';
import 'package:bukateria/widgets/pop_menu.dart';
import 'package:bukateria/widgets/recipe_card.dart';
import 'package:bukateria/widgets/related_recipe.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class MenuDetailView extends GetView {
  MenuDetailView({Key? key, required this.menu}) : super(key: key);
  int? countControllerValue;
  final menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
            elevation: 1,
            automaticallyImplyLeading: true,
            backgroundColor: white,
            iconTheme: IconThemeData(color: dark),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      color: dark,
                      size: 30,
                    ),
                    PopMenu(),
                  ],
                ),
              )
            ],
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("${menu.image}"))),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 13,
                ),
                Text(
                  "${menu.title}",
                  style: title3,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                '${menu.user.avatar}',
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${menu.user.firstName} ${menu.user.lastName}',
                                  style: body4),
                              Text('${menu.user.platFormName}', style: body5),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: green,
                                    size: 20,
                                  ),
                                  Text('${menu.location}', style: body5),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                        width: 90,
                        radius: 30,
                        height: 35,
                        onPressed: () => {},
                        color: primary,
                        text: "Follow")
                  ],
                ),

                // Generated code for this subtitle Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'Description',
                    style: title5,
                  ),
                ),

                // Generated code for this body_text Widget...
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: ReadMoreText(
                      '${menu.description}',
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      style: body3,
                    )),

                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    width: 300,
                    radius: 30,
                    height: 45,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30),
                              child: Container(
                                height: Get.height * 0.4,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order",
                                          style: title3,
                                        ),
                                        Text(
                                          "ID: 5673h33",
                                          style: title5,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Pickup Address",
                                          style: title5,
                                        ),
                                        // Text(
                                        //   "Change Address",
                                        //   style: body3.copyWith(color: blue),
                                        // )
                                      ],
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.location_pin),
                                                  Text("Abuja, Nigeria")
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.person),
                                                  Text("Shola Kilode")
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.phone),
                                                  Text("+234-801-998882282")
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomButton(
                                        radius: 30,
                                        color: primary,
                                        height: 40,
                                        onPressed: () =>
                                            Get.to(() => PaymentWidget()),
                                        width: 200,
                                        text: "Confirm order")
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    color: dark,
                    text: "Place Order"),

                // Generated code for this Row Widget...
                SizedBox(
                  height: 20,
                ),

                // Generated code for this subtitle Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'Other menus by @toyin_345',
                    style: title5,
                  ),
                ),
                // Generated code for this menuItem Widget...
                RelatedRecipe(
                  title: "Okro Soup",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/fd3.jpg",
                ),
                SizedBox(
                  height: 10,
                ),
                RelatedRecipe(
                  title: "Shakky Pepper soup",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/fd5.jpg",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

// Generated code for this author_info Widget...
        ]))
      ]),
    );
  }
}
