import 'dart:io';

import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';

import '../cubit/post_cubit/post_cubit.dart';

class ExploreCard extends StatefulWidget {
  final explore;
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

  ExploreCard({super.key, required this.explore});
  @override
  _ExploreCardState createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FadeInImage(
            width: double.infinity,
            height: 181,
            fit: BoxFit.fill,
            image: NetworkImage(
              //widget.product[Constants.image]
                '${widget.explore.image}'
            ),
            placeholder: AssetImage(
              "assets/images/big_logo.png",
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.explore.title}', style: title5),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            child: Text('${widget.explore.description}',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: false,
                style: body4),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
            child: StreamBuilder<DocumentSnapshot<Object?>>(
              stream: context.read<PostCubit>().getSpecificUser(widget.explore.uid),
              builder: (context, snap) {
                if (snap.hasData) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 0, 10, 0),
                        child: Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child:
                          Image.asset("assets/images/avatar1.png",width: 60,height: 60,)
                          /*FadeInImage(
                                width: double.infinity,
                                height: 151,
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    '${snap.data?["image"]}'
                                ),
                                placeholder: AssetImage(
                                  "assets/images/big_logo.png",
                                ),
                              )*/,
                        ),
                      ),
                      Expanded(
                        child: Text(
                            '${snap.data?["email"]}',
                            style: body4),
                      ),
                      Row(
                        children: [
                          Icon(
                            true ? Icons.favorite : Icons.favorite_outline,
                            color: false ? primary : dark,
                            size: 24,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("2,500")
                        ],
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
