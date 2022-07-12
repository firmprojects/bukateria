import 'package:bukateria/flutter_flow/flutter_flow_theme.dart';
import 'package:bukateria/themes/text.dart';
import 'package:bukateria/widgets/notification_item.dart';
import 'package:bukateria/widgets/related_recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  _FavouritesViewState createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Favourites',
          style: title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              RelatedRecipe(
                title: "Okro Soup",
                text:
                    "A wonderfully delicious 2 patty melt that melts into your...",
                image: "assets/images/fd3.jpg",
              ),
              SizedBox(
                height: 10,
              ),
              RelatedRecipe(
                title: "Shakky Pepper soup",
                text:
                    "A wonderfully delicious 2 patty melt that melts into your...",
                image: "assets/images/fd5.jpg",
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
