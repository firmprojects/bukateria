// @dart=2.9

import 'package:bukateria/bloc/auth/auth_bloc.dart';
import 'package:bukateria/cubit/account_cubit/account_cubit.dart';
import 'package:bukateria/cubit/onboarding_cubit/onboard_cubit.dart';
import 'package:bukateria/cubit/place_search_cubit/place_search_cubit.dart';
import 'package:bukateria/cubit/post_cubit/post_cubit.dart';
import 'package:bukateria/cubit/role_view_cubit/roleview_cubit.dart';
import 'package:bukateria/cubit/signin_cubit.dart';
import 'package:bukateria/cubit/signup_cubit.dart';
import 'package:bukateria/cubit/splash_cubit/splash_cubit.dart';
import 'package:bukateria/repository/auth_repository.dart';
import 'package:bukateria/repository/postRepository/post_repository.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart' as setting;
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_preference.dart';

Future main() async {
  print("---------------");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  MyPref myPref = MyPref.getInstance();
  myPref.getData();
  await setting.Settings.init(cacheProvider: setting.SharePreferenceCache());

  runApp(MyApp(
    myPref: myPref,
  ));
}

class MyApp extends StatelessWidget {
  MyPref myPref;

  MyApp({this.myPref, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* return MaterialApp(
      home: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
        ),
      ),
    );*/

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => PostRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SignupCubit>(
              create: (context) =>
                  SignupCubit(authRepository: context.read<AuthRepository>())),
          BlocProvider<SigninCubit>(
              create: (context) =>
                  SigninCubit(authRepository: context.read<AuthRepository>())),
          BlocProvider<RoleViewCubit>(
              create: (context) => RoleViewCubit(
                  authRepository: context.read<AuthRepository>())),
          BlocProvider<OnboardCubit>(
              create: (context) =>
                  OnboardCubit(authRepository: context.read<AuthRepository>())),
          BlocProvider<SplashCubit>(
              create: (context) =>
                  SplashCubit(authRepository: context.read<AuthRepository>())),
          BlocProvider<PostCubit>(
              create: (context) =>
                  PostCubit(authRepository: context.read<AuthRepository>(), postRepository: context.read<PostRepository>())),
          BlocProvider<PlaceSearchCubit>(
              create: (context) =>
                  PlaceSearchCubit(authRepository: context.read<AuthRepository>(), postRepository: context.read<PostRepository>())),
       BlocProvider<AccountCubit>(
              create: (context) =>
                  AccountCubit(authRepository: context.read<AuthRepository>(), postRepository: context.read<PostRepository>())),
        ],
        child: GetMaterialApp(
                title: "Bukkateria",
                initialRoute: AppPages.INITIAL,
                theme: ThemeData(
                    primaryColor: primary,
                    appBarTheme: AppBarTheme(color: primary)),
                getPages: AppPages.routes,
                // home: AddRecipeWidget(),
                debugShowCheckedModeBanner: false,
              )
      ),
    );
  }
}
