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

class MenuCardComponentWidget extends StatefulWidget {
  final menus;
  final index;
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

  MenuCardComponentWidget(
      {super.key, required this.menus, required this.index});
  @override
  _MenuCardComponentWidgetState createState() =>
      _MenuCardComponentWidgetState();
}

class _MenuCardComponentWidgetState extends State<MenuCardComponentWidget> {
  @override
  Widget build(BuildContext context) {
    var menu = widget.menus[widget.index];
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
                    onTap: () => Get.to(
                        () => MenuDetailView(menu: widget.menus[widget.index])),
                    child: Image.asset(
                      '${menu.image}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            menu.deliveyStatus
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
                      Text('${menu.stars}', style: body4),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${widget.formatCurrency.format(menu.amount)}',
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
  }
}
