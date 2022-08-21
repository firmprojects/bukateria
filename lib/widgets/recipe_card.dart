import 'package:bukateria/app/modules/recipes/views/recipe_detail_view.dart';
import 'package:bukateria/themes/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({Key? key, required this.recipe}) : super(key: key);

  final recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => RecipeDetailView(recipe: recipe)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 150,
              fit: BoxFit.cover,
              imageUrl: "${recipe.image}",
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
          child: GestureDetector(
              onTap: () => Get.to(() => RecipeDetailView(recipe: recipe)),
              child: Text('${recipe.title}',
                  textAlign: TextAlign.start, style: title6)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('${recipe.category}', style: body5),
            // Text('${recipe.duration}', style: body5),
          ],
        ),
      ],
    );
  }
}
