import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:flutter/material.dart';

class MethodWidget extends StatelessWidget {
  MethodWidget({Key? key, required this.text, this.image}) : super(key: key);

  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          leading: Icon(
            Icons.check_circle,
            color: Colors.black,
            size: 30,
          ),
          title: Text(
            '$text',
            style: body3,
          ),
          dense: false,
        ),
        Align(
            alignment: AlignmentDirectional(0.7, 0),
            child: FadeInImage(
              width: 250,
              height: 100,
              fit: BoxFit.fill,
              image: NetworkImage(
                  //widget.product[Constants.image]
                  '${image}'),
              placeholder: AssetImage(
                "assets/images/big_logo.png",
              ),
            )

            /*Image.asset(
            '$image',
            width: 250,
            height: 100,
            fit: BoxFit.cover,
          ),*/
            ),
      ],
    );
  }
}
