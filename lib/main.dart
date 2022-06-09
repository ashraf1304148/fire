import 'package:fire/controller/main_controller.dart';
import 'package:fire/pages/home_page.dart';
import 'package:fire/pages/log_in_page.dart';
import 'package:fire/pages/sign_up_page.dart';
import 'package:fire/routes/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(MainController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut((() => AuthController()));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
