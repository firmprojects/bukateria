import 'package:bukateria/app/modules/menus/views/menu_detail_view.dart';
import 'package:bukateria/data/menus_list.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCardComponentWidget extends StatefulWidget {
  final menus;
  final index;

  const MenuCardComponentWidget(
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
                    onTap: () => Get.to(() => MenuDetailView()),
                    child: Image.asset(
                      '${menu.image}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Align(
                //   alignment: AlignmentDirectional(1, -1),
                //   child: Padding(
                //     padding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 0),
                //     child: Container(
                //       width: 70,
                //       height: 32,
                //       decoration: BoxDecoration(
                //         color: blue,
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       alignment: AlignmentDirectional(0, 0),
                //       child: Padding(
                //         padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                //         child: Text('menu', style: body5),
                //       ),
                //     ),
                //   ),
                // ),
              ],
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
                      child: Image.asset(
                        'assets/images/customer.jpg',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text('Toyin kitchen', style: body4),
                  ),
                  Icon(
                    Icons.favorite,
                    color: primary,
                    size: 24,
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
              child: Text('${menu.description}', style: body4),
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
                      Text('${menu.amount}', style: title5),
                      Text('${menu.location}', style: body4),
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
