import 'package:bukateria/app/modules/menus/views/menu_detail_view.dart';
import 'package:bukateria/app/modules/recipes/views/recipe_detail_view.dart';
import 'package:bukateria/themes/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileMenuCard extends StatelessWidget {
  ProfileMenuCard({Key? key, required this.menu}) : super(key: key);

  final menu;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => MenuDetailView(menu: menu)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 150,
                fit: BoxFit.cover,
                imageUrl: "${menu.image}",
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
          child: GestureDetector(
              onTap: () => Get.to(() => RecipeDetailView(recipe: menu)),
              child: Text('${menu.title}',
                  textAlign: TextAlign.start, style: title6)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Date: " + DateFormat('MMM dd, yyyy').format(menu.created_at),
                style: body5),
          ],
        ),
      ],
    );
  }
}
