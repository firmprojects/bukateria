import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipes_controller.dart';

class RecipesView extends GetView<RecipesController> {
  const RecipesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        title: Text(
          'Recipes',
          style: title4,
        ),
        iconTheme: IconThemeData(color: dark),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.6,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
