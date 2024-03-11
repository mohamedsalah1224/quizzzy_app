import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:quizzy_app/Service/local/auth_route_service.dart';
import 'package:quizzy_app/Service/local/cache_subject_service.dart';
import 'package:quizzy_app/Service/local/cache_user_service.dart';
import 'package:quizzy_app/Service/nottification/push_notification_service.dart';
import 'package:quizzy_app/model/Image_dimensions_model.dart';
import 'package:quizzy_app/model/academic_year_model.dart';
import 'package:quizzy_app/model/book_model.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/model/subjects_model.dart';
import 'package:quizzy_app/model/user_model.dart';

import 'package:quizzy_app/utils/binding/splash_binding.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/utils/dialog_helper.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
  print(message.notification!.title);
  print(message.notification!.body);
  // SnackBarHelper.instance.showMessage(message: "Mohamed", showByGetx: true);
}

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
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await PushNotificationService().initPushNotification();
  await PushNotificationService().subscribeToTopic(topicName: "general");

  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();

  Hive.registerAdapter(AcademicYearModelAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SubjectsModelAdapter());
  Hive.registerAdapter(DataSubjectModelAdapter());
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(ImageDimensionsModelAdapter());
  await AuthRouteService.instance.init();
  await CacheUserService.instance.init();
  await CacheSubjectService.instance.init();

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

