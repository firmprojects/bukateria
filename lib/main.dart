// @dart=2.9

import 'package:bukateria/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(
    GetMaterialApp(
      title: "Bukkateria",
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
          primaryColor: primary, appBarTheme: AppBarTheme(color: primary)),
      getPages: AppPages.routes,
      // home: AddRecipeWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
