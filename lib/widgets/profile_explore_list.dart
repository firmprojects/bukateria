import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/profile_menu_card.dart';
import 'package:bukateria/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class ProfileExploreList extends StatelessWidget {
  const ProfileExploreList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Explore Posts",
            style: title4,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: recipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ProfileMenuCard(recipes: menus, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
