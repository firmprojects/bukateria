// @dart=2.9

import 'package:bukateria/bloc/auth/auth_bloc.dart';
import 'package:bukateria/cubit/signup_cubit.dart';
import 'package:bukateria/repository/auth_repository.dart';
import 'package:bukateria/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  // await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SignupCubit>(
              create: (_) =>
                  SignupCubit(authRepository: context.read<AuthRepository>()))
        ],
        child: GetMaterialApp(
          title: "Bukkateria",
          initialRoute: AppPages.INITIAL,
          theme: ThemeData(
              primaryColor: primary, appBarTheme: AppBarTheme(color: primary)),
          getPages: AppPages.routes,
          // home: AddRecipeWidget(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
