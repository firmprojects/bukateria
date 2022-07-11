import 'package:bukateria/themes/colors.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PlaceSearch extends StatelessWidget {
  const PlaceSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Expanded(
                  child: CustomInput(
                height: 70,
                borderRadius: 10,
                filled: true,
                bgcolor: white,
                labelText: "Search location",
                suffixIcon: Icons.search,
              ))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/images/location.png",
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Add a place of origin",
              style: title3.copyWith(color: Colors.black38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: Text(
              "Indicate your country, state, town or region where your menu is originating from ",
              style: body3.copyWith(color: Colors.black38),
            ),
          )
        ],
      ),
    );
  }
}
