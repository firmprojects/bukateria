import 'package:bukateria/app/modules/recipes/views/recipe_detail_view.dart';
import 'package:bukateria/themes/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileExploreCard extends StatelessWidget {
  ProfileExploreCard({Key? key, required this.exploreModel}) : super(key: key);

  final exploreModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       Padding(
        //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
        //         child: Container(
        //           width: 30,
        //           height: 30,
        //           clipBehavior: Clip.antiAlias,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //           ),
        //           child: Image.asset(
        //             '${recipe.user.avatar}',
        //           ),
        //         ),
        //       ),
        //       Text('${recipe.user.firstName} ${recipe.user.lastName}',
        //           style: body5),
        //     ],
        //   ),
        // ),
        GestureDetector(
          //onTap: () => Get.to(() => RecipeDetailView(recipe: recipe)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 150,
              fit: BoxFit.cover,
              imageUrl: "${exploreModel.image}",
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
          child: GestureDetector(
              //onTap: () => Get.to(() => RecipeDetailView(recipe: recipe)),
              child: Text('${exploreModel.title}',
                  textAlign: TextAlign.start, style: title6)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
                "Date: " +
                    DateFormat('MMM dd, yyyy').format(exploreModel.created_at),
                style: body5),
          ],
        ),
      ],
    );
  }
}
