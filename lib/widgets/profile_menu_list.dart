import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMenusList extends StatelessWidget {
  const ProfileMenusList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Container(
          width: 150,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/square.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                child: Text('Banga Soup',
                    textAlign: TextAlign.start, style: title5),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Food > ', style: body5),
                  Text('60 mins', style: body5),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 150,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/square.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                child: Text('Banga Soup',
                    textAlign: TextAlign.start, style: title5),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Food > ', style: body5),
                  Text('60 mins', style: body5),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 150,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/square.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                  child: Text('Banga Soup',
                      textAlign: TextAlign.start, style: title5),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Food > ', style: body5),
                    Text('60 mins', style: body5),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          width: 150,
          height: 220,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/square.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                child: Text('Banga Soup',
                    textAlign: TextAlign.start, style: title5),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Food > ', style: body5),
                  Text('60 mins', style: body5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
