import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:quizzy_app/utils/binding/splash_binding.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDdVCRDAMv1kDwJnoYkZfs68KdqXE47sT8",
              appId: "1:357000354067:android:e16aeca42f8346b71062e6",
              messagingSenderId: "357000354067",
              projectId: "quizzyapp-58b44"))
      : await Firebase.initializeApp();

  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initialRoute,
          initialBinding: SplashBinding(),
          getPages: Routes.getPages(),
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
/*
MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // locale: Locale("ar"),

      home: const ManageBottomNavigationView(),
    );

*/