import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/models/menus_model.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/menu_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/post_cubit/post_cubit.dart';

class MenusView extends StatefulWidget {
  @override
  State<MenusView> createState() => _MenusViewState();
}

class _MenusViewState extends State<MenusView> {
  //MenusView({Key? key}) : super(key: key);
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
          stream:  context.read<PostCubit>().getMenus(),
    builder: (context,snap){
    if(snap.hasData) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: primary,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1, right: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ikeja, Lagos",
                          style: body3.copyWith(color: white),
                        ),
                      ],
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () => {
                //     showSearch(context: context, delegate: MenuSearchDelegate())
                //   },
                //   child: Container(
                //       margin: EdgeInsets.only(left: 1, right: 1, bottom: 15),
                //       padding: EdgeInsets.symmetric(horizontal: 15),
                //       decoration: BoxDecoration(
                //           color: white, borderRadius: BorderRadius.circular(10)),
                //       height: 45,
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.search,
                //             color: dark,
                //           ),
                //           SizedBox(
                //             width: 40,
                //           ),
                //           Text(
                //             "Search menus",
                //             style: body3,
                //           )
                //         ],
                //       )),
                // ),
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: snap.data?.docs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          MenusModel model = MenusModel(
                            key: snap.data?.docs[index]["key"],
                            title: snap.data?.docs[index]["title"],
                            description: snap.data?.docs[index]["description"],
                            productStatus: snap.data?.docs[index]["productStatus"],
                            created_at: (snap.data?.docs[index]["created_at"] as Timestamp).toDate(),
                            image: snap.data?.docs[index]["image"],
                            uid: snap.data?.docs[index]["uid"],
                            deliveryType: snap.data?.docs[index]["deliveryType"],
                            price: snap.data?.docs[index]["price"],
                            location: snap.data?.docs[index]["location"],
                          );
                          return MenuCardComponentWidget(
                            menu: model,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ));
    }
    return const Padding(padding: EdgeInsets.all(12),
      child:  Text("Loading, please wait... "),
    );
    });
    },),
    );
  }
}
