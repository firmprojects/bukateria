import 'dart:io';

import 'package:bukateria/app/modules/menus/views/menu_detail_view.dart';
import 'package:bukateria/data/menus_list.dart';
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

class MenuCardComponentWidget extends StatefulWidget {
  final menu;

  final formatCurrency = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

  MenuCardComponentWidget(
      {super.key, required this.menu});
  @override
  _MenuCardComponentWidgetState createState() =>
      _MenuCardComponentWidgetState();
}

class _MenuCardComponentWidgetState extends State<MenuCardComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostCubit, PostState>(listener: (context, state) {

    }, child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state)
    {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x3D0F1113),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () =>
                          Get.to(
                                  () => MenuDetailView(menu: widget.menu)),
                      child: FadeInImage(
                        width: double.infinity,
                        height: 181,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          //widget.product[Constants.image]
                            '${widget.menu.image}'
                        ),
                        placeholder: AssetImage(
                          "assets/images/big_logo.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              widget.menu.deliveryType == "pickup"
                  ? Padding(
                padding: const EdgeInsets.only(top: 0, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset("assets/images/delivery2.png")],
                ),
              )
                  : Padding(
                padding: const EdgeInsets.only(top: 0, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                  stream: context.read<PostCubit>().getSpecificUser(widget.menu.uid),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.menu.title}', style: title5),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: Text('${widget.menu.description}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: false,
                    style: body4),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: orange,
                          size: 24,
                        ),
                        Text('5 Stars', style: body4),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${widget.formatCurrency.format(double.parse(widget.menu.price))}',
                            style: title5),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }),
    );
  }
}
