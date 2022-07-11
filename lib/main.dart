import 'package:bukateria/app/modules/recipes/views/create_recipe_view.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
          primaryColor: primary, appBarTheme: AppBarTheme(color: primary)),
      getPages: AppPages.routes,
      // home: AddRecipeWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
