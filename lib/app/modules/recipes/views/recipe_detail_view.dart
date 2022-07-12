import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:bukateria/widgets/ingredientItem.dart';
import 'package:bukateria/widgets/pop_menu.dart';
import 'package:bukateria/widgets/related_recipe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class RecipeDetailView extends GetView {
  RecipeDetailView({Key? key, required this.recipe}) : super(key: key);
  final recipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
              elevation: 1,
              automaticallyImplyLeading: true,
              backgroundColor: white,
              iconTheme: IconThemeData(color: dark),
              expandedHeight: 250,
              actions: [
                PopMenu(),
              ],
              pinned: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("${recipe.image}"))),
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
                    "${recipe.title}",
                    style: title3.copyWith(fontWeight: FontWeight.w500),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                              child: Container(
                                width: 40,
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  '${recipe.user.avatar}',
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${recipe.user.firstName} ${recipe.user.lastName}',
                                    style: body4),
                                Text('${recipe.user.platFormName}',
                                    style: body5),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: green,
                                      size: 20,
                                    ),
                                    Text('${recipe.location}', style: body5),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          CustomButton(
                              width: 90,
                              radius: 30,
                              height: 35,
                              color: primary,
                              onPressed: () => {},
                              text: "Follow"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_outline,
                                color: dark,
                                size: 25,
                              ),
                              Text("2,500"),
                            ],
                          ),
                        ],
                      )
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
                        '${recipe.description}',
                        trimCollapsedText: "show more",
                        trimLines: 4,
                        trimMode: TrimMode.Line,
                        style: body3,
                      )),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                    child: Text(
                      'Ingredients',
                      style: title5,
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

                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  //   child: Text(
                  //     'Methods',
                  //     style: title3,
                  //   ),
                  // ),

                  // Generated code for this Column Widget...
                  // MethodWidget(
                  //   text:
                  //       'Your recipe has been uploaded, you can see it on your profile.',
                  //   image: "assets/images/fd6.jpg",
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // MethodWidget(
                  //   text:
                  //       'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, ',
                  //   image: "assets/images/fd7.jpg",
                  // ),

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
                      style: title4,
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
                    height: 20,
                  ),
                ],
              ),
            ),

            // Generated code for this author_info Widget...
          ]))
        ]),
      ),
    );
  }
}
