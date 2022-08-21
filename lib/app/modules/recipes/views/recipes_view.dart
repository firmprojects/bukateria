import 'package:bukateria/app/modules/account/views/chef_settings.dart';
import 'package:bukateria/app/modules/dashboard/views/dashboard_view.dart';
import 'package:bukateria/app/modules/dashboard/views/vendor_dashboard.dart';
import 'package:bukateria/cubit/post_cubit/post_cubit.dart';
import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/models/recipe_model.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/recipe_card.dart';
import 'package:bukateria/widgets/search_delegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../controllers/recipes_controller.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({Key? key}) : super(key: key);

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  final _controller = ValueNotifier<bool>(false);

// ...
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostCubit, PostState>(listener: (context, state) {

    }, child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state)
    {
      return StreamBuilder<QuerySnapshot>(
          stream:  context.read<PostCubit>().getAllRecipes(),
    builder: (context,snap){
    if(snap.hasData) {
     /*
      List<QuerySnapshot> list = [];
      list = snap.data.docs;

      print("--------length--------${snap.data?.docs.length}");
      snap.data?.docs.forEach((element) {
        element["list"].forEach((element1){
          list.add(element1);
          print("----------${list.length}");
        });
      });*/
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 110,
        backgroundColor: primary,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   "Ikeja, Lagos",
                    //   style: body3.copyWith(color: white),
                    // ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                showSearch(context: context, delegate: MenuSearchDelegate())
              },
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: dark,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Search recipes",
                        style: body3,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: snap.data?.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  RecipeModel model = RecipeModel(
                    key: snap.data?.docs[index]["key"],
                    title: snap.data?.docs[index]["title"],
                    description: snap.data?.docs[index]["description"],
                    productStatus: snap.data?.docs[index]["productStatus"],
                    created_at: (snap.data?.docs[index]["created_at"] as Timestamp).toDate(),
                    image: snap.data?.docs[index]["image"],
                    uid: snap.data?.docs[index]["uid"],
                    cuisine: snap.data?.docs[index]["cuisine"],
                    category: snap.data?.docs[index]["category"],
                  );
                  return RecipeCard(recipe: model);
                },
              ),
            ),
          ],
        ),
      ),
    );
    }

    return const Padding(padding: EdgeInsets.all(12),
      child:  Text("Loading, please wait... "),
    );
    });
    },),
    );
  }
}
