import 'package:auto_size_text/auto_size_text.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:bukateria/widgets/ingredientItem.dart';
import 'package:bukateria/widgets/method_widget.dart';
import 'package:bukateria/widgets/recipe_card.dart';
import 'package:bukateria/widgets/related_recipe.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuDetailView extends GetView {
  MenuDetailView({Key? key}) : super(key: key);
  int? countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
            elevation: 1,
            automaticallyImplyLeading: true,
            backgroundColor: white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.heart_broken,
                      color: primary,
                    ),
                    Icon(
                      Icons.three_p_outlined,
                      color: primary,
                    )
                  ],
                ),
              )
            ],
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/egusi.jpg"))),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Banga Soup Recipe",
                  style: title2.copyWith(fontWeight: FontWeight.w500),
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
                                'assets/images/customer.jpg',
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Toyin Kitchen', style: body4),
                              Text('@toyin_345', style: body5),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: green,
                                    size: 20,
                                  ),
                                  Text('Abuja Nigeria', style: body5),
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
                        text: "Order")
                  ],
                ),

                // Generated code for this subtitle Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'Description',
                    style: title3,
                  ),
                ),

                // Generated code for this body_text Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Text(
                      'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your \nYour recipe has been uploaded, you can see it on your profile.',
                      style: body3),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'Ingredients',
                    style: title3,
                  ),
                ),

                // Generated code for this ListTile Widget...
                IngredientItem(
                  text: "Palm nuts",
                ),
                IngredientItem(
                  text: "Dried Fish",
                ),
                IngredientItem(
                  text: "Table spoon of Salt",
                ),
                IngredientItem(
                  text: "1kg of beef",
                ),
                IngredientItem(
                  text: "Locust beans",
                ),
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
                                height: Get.height * 0.75,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Confirm Order",
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
                                          "Delivery To",
                                          style: title5,
                                        ),
                                        Text(
                                          "Add Address",
                                          style: body3.copyWith(color: blue),
                                        )
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
                                    Container(
                                      color: grey,
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Delivery Time",
                                            style: body2,
                                          ),
                                          Text(
                                            "3 days",
                                            style: title4,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/egusi.jpg",
                                                width: 120,
                                                height: 100,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Pot of Egusi Soup",
                                                    style: title5,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "With 2kg of beef",
                                                    style: body4,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Subtotal(1 pot of soup)",
                                                style: title5,
                                              ),
                                              Text(
                                                "N12,000",
                                                style: title5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Shipping",
                                                style: title5,
                                              ),
                                              Text(
                                                "N2,000",
                                                style: title5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total",
                                                style: title5.copyWith(
                                                    color: primary),
                                              ),
                                              Text(
                                                "N2,000",
                                                style: title5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomButton(
                                              radius: 30,
                                              color: primary,
                                              height: 40,
                                              onPressed: () {},
                                              width: 200,
                                              text: "Confirm order")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    color: primary,
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
                    style: title3,
                  ),
                ),
                // Generated code for this menuItem Widget...
                RelatedRecipe(
                  title: "Pot of Ogbono Soup",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/egusi.jpg",
                ),
                SizedBox(
                  height: 10,
                ),
                RelatedRecipe(
                  title: "Beans Cake",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/egusi.jpg",
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
