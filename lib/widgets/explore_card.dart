import 'dart:io';

import 'package:bukateria/app/modules/menus/views/menu_detail_view.dart';
import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';

class ExploreCard extends StatefulWidget {
  final menus;
  final index;
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

  ExploreCard({super.key, required this.menus, required this.index});
  @override
  _ExploreCardState createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    var menu = widget.menus[widget.index];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            '${menu.image}',
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${menu.title}', style: title5),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            child: Text('${menu.description}',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: false,
                style: body4),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('${menu.user.avatar}'),
                  ),
                ),
                Expanded(
                  child: Text('${menu.user.firstName} ${menu.user.lastName}',
                      style: body4),
                ),
                Row(
                  children: [
                    Icon(
                      menu.likes ? Icons.favorite : Icons.favorite_outline,
                      color: menu.likes ? primary : dark,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("2,500")
                  ],
                ),
              ],
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
