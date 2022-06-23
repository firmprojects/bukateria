import 'package:bukateria/app/modules/recipes/views/recipe_detail_view.dart';
import 'package:bukateria/themes/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
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
              Text('Toyin Kitchen', style: body5),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://picsum.photos/seed/588/600',
            width: double.infinity,
            height: 151,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
          child: GestureDetector(
              onTap: () => Get.to(() => RecipeDetailView()),
              child: Text('Banga Soup',
                  textAlign: TextAlign.start, style: title5)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Food > ', style: body5),
            Text('60 mins', style: body5),
          ],
        ),
      ],
    );
  }
}
