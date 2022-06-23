import 'package:auto_size_text/auto_size_text.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:bukateria/widgets/ingredientItem.dart';
import 'package:bukateria/widgets/method_widget.dart';
import 'package:bukateria/widgets/related_recipe.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RecipeDetailView extends GetView {
  const RecipeDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
            elevation: 1,
            automaticallyImplyLeading: true,
            backgroundColor: white,
            title: Text("Repcipe detail"),
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
                        text: "Follow")
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
                      'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your \nYour recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
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

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'Methods',
                    style: title3,
                  ),
                ),

                // Generated code for this Column Widget...
                MethodWidget(
                  text:
                      'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your \n',
                  image: "assets/images/egusi.jpg",
                ),
                MethodWidget(
                  text:
                      'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your \n',
                  image: "assets/images/egusi.jpg",
                ),
                MethodWidget(
                  text:
                      'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your \n',
                  image: "assets/images/egusi.jpg",
                ),

                // Generated code for this Row Widget...
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),

                Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Icon(
                                Icons.chat_bubble_outline_sharp,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Text('Comments', style: body3),
                            ),
                            Text(
                              '1',
                              style: body3,
                            ),
                          ],
                        ),
                      ),

                      // Generated code for this Text Widget...
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'View all comments',
                          style: body3,
                        ),
                      ),
                      // Generated code for this user_widget Widget...
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                              child: Container(
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/customer.jpg',
                                ),
                              ),
                            ),
                            Text('Toyin Kitchen', style: body3),
                            Icon(
                              Icons.favorite,
                              color: primary,
                              size: 24,
                            ),
                            Icon(
                              Icons.favorite,
                              color: primary,
                              size: 24,
                            ),
                            Icon(
                              Icons.favorite,
                              color: primary,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                            child: CustomInput(
                          height: 60,
                          suffixIcon: Icons.send,
                          labelText: "Add comment",
                          filled: true,
                          bgcolor: white,
                          borderRadius: 30,
                        )),
                      )
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),

                // Generated code for this subtitle Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: Text(
                    'Other recipes by @toyin_345',
                    style: title3,
                  ),
                ),
                // Generated code for this menuItem Widget...
                RelatedRecipe(
                  title: "Fried rice repipe",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/egusi.jpg",
                ),
                SizedBox(
                  height: 10,
                ),
                RelatedRecipe(
                  title: "Fried rice repipe",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/egusi.jpg",
                ),
                SizedBox(
                  height: 10,
                ),
                RelatedRecipe(
                  title: "Fried rice repipe",
                  text:
                      "A wonderfully delicious 2 patty melt that melts into your...",
                  image: "assets/images/egusi.jpg",
                ),
                SizedBox(
                  height: 20,
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
