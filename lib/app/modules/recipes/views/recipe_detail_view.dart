import 'package:bukateria/cubit/post_cubit/post_cubit.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:bukateria/widgets/ingredientItem.dart';
import 'package:bukateria/widgets/method_widget.dart';
import 'package:bukateria/widgets/pop_menu.dart';
import 'package:bukateria/widgets/related_recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class RecipeDetailView extends StatefulWidget {
  const RecipeDetailView({Key? key, required this.recipe}) : super(key: key);
  final recipe;
  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostCubit, PostState>(
      listener: (context, state) {},
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return StreamBuilder<QuerySnapshot>(
              stream: context
                  .read<PostCubit>()
                  .getSpecificFollow(widget.recipe.uid),
              builder: (context, snap) {
                if (snap.hasData) {
                  return SafeArea(
                    child: Scaffold(
                      body: CustomScrollView(slivers: [
                        SliverAppBar(
                            elevation: 1,
                            automaticallyImplyLeading: true,
                            backgroundColor: white,
                            iconTheme: const IconThemeData(color: dark),
                            expandedHeight: 250,
                            actions: [
                              PopMenu(),
                            ],
                            pinned: true,
                            flexibleSpace: Container(
                              /*decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("${recipe.image}"))),*/
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: "${widget.recipe.image}",
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            )),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  "${widget.recipe.title}",
                                  style: title3.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 8),
                                      child: StreamBuilder<
                                          DocumentSnapshot<Object?>>(
                                        stream: context
                                            .read<PostCubit>()
                                            .getSpecificUser(widget.recipe.uid),
                                        builder: (context, snap) {
                                          if (snap.hasData) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 7, 0),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/avatar1.png',
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        '${snap.data?["email"]}',
                                                        style: body4),
                                                  ],
                                                ),
                                              ],
                                            );
                                          }
                                          return Container();
                                        },
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        CustomButton(
                                            width: 90,
                                            radius: 30,
                                            height: 35,
                                            color: primary,
                                            onPressed: () => {
                                                  if (FirebaseAuth.instance
                                                          .currentUser?.uid !=
                                                      widget.recipe.uid)
                                                    {
                                                      context
                                                          .read<PostCubit>()
                                                          .addFollow(
                                                              FirebaseAuth
                                                                      .instance
                                                                      .currentUser
                                                                      ?.uid ??
                                                                  "",
                                                              widget.recipe.uid)
                                                    }
                                                },
                                            text: snap.data!.docs.isNotEmpty
                                                ? snap.data?.docs[0]
                                                            ["followingUID"] ==
                                                        FirebaseAuth.instance
                                                            .currentUser?.uid
                                                    ? "Followed"
                                                    : "Follow"
                                                : "Follow"),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                // Generated code for this subtitle Widget...
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 10),
                                  child: Text(
                                    'Description',
                                    style: title5,
                                  ),
                                ),

                                // Generated code for this body_text Widget...
                                Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                    child: ReadMoreText(
                                      '${widget.recipe.description}',
                                      trimCollapsedText: "show more",
                                      trimLines: 4,
                                      trimMode: TrimMode.Line,
                                      style: body3,
                                    )),

                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 10),
                                  child: Text(
                                    'Ingredients',
                                    style: title5,
                                  ),
                                ),

                                StreamBuilder<QuerySnapshot>(
                                    stream: context
                                        .read<PostCubit>()
                                        .getIngredients(widget.recipe.key),
                                    builder: (context, snap) {
                                      print(
                                          "-----------vvv------------- ${snap.hasData} ${snap.data?.docs.length}");
                                      if (snap.hasData) {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount: snap.data?.docs.length,
                                            itemBuilder: (context, index) {
                                              return IngredientItem(
                                                text: snap.data?.docs[index]
                                                    ["ingredient"],
                                              );
                                            });
                                      }
                                      return Container();
                                    }),

                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 10),
                                  child: Text(
                                    'Methods',
                                    style: title3,
                                  ),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: context
                                        .read<PostCubit>()
                                        .getMethods(widget.recipe.key),
                                    builder: (context, snap) {
                                      print(
                                          "-----------www------------- ${snap.hasData} ${snap.data?.docs.length}");
                                      if (snap.hasData) {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount: snap.data?.docs.length,
                                            itemBuilder: (context, index) {
                                              return MethodWidget(
                                                text: snap.data?.docs[index]
                                                    ["text"],
                                                image: snap.data?.docs[index]
                                                    ["image"],
                                              );
                                            });
                                      }
                                      return Container();
                                    }),
                                // Generated code for this Row Widget...
                                const SizedBox(
                                  height: 20,
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),

                                Container(
                                  color:
                                      const Color.fromARGB(255, 233, 233, 233),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 20, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: Icon(
                                                Icons.chat_bubble_outline_sharp,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                              child: Text('Comments',
                                                  style: body3),
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
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 10),
                                        child: Text(
                                          'View all comments',
                                          style: body3,
                                        ),
                                      ),
                                      // Generated code for this user_widget Widget...
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 7, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/customer.jpg',
                                                ),
                                              ),
                                            ),
                                            Text('Toyin Kitchen', style: body3),
                                            const Icon(
                                              Icons.favorite,
                                              color: primary,
                                              size: 24,
                                            ),
                                            const Icon(
                                              Icons.favorite,
                                              color: primary,
                                              size: 24,
                                            ),
                                            const Icon(
                                              Icons.favorite,
                                              color: primary,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: Container(
                                            child: const CustomInput(
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

                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Generated code for this subtitle Widget...
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 10),
                                  child: Text(
                                    "Other recipes by ",
                                    style: title4,
                                  ),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: context
                                        .read<PostCubit>()
                                        .getRelatedRecipes(widget.recipe.uid),
                                    builder: (context, snap) {
                                      print(
                                          "-----------www------------- ${snap.hasData} ${snap.data?.docs.length}");
                                      if (snap.hasData) {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount: snap.data?.docs.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: RelatedRecipe(
                                                  title: snap.data?.docs[index]
                                                      ['title'],
                                                  text: snap.data?.docs[index]
                                                      ['description'],
                                                  image: snap.data?.docs[index]
                                                      ['image'],
                                                ),
                                              );
                                            });
                                      }
                                      return Container();
                                    }),
                                const SizedBox(
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

                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Scaffold(
                    body: Container(
                        child: Center(child: Text("Loading, please wait... "))),
                  ),
                );
              });
        },
      ),
    );
  }
}
