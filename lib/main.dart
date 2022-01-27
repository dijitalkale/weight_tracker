import 'package:intl/date_symbol_data_local.dart'; //data time picker dil için eklendi
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:intl/intl.dart'; //data time pformat eklendi
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Views/homePage/homePage.dart';

void main() async {
  // firebase için eklendi
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var a = Intl.defaultLocale =
        'tr'; //datetime picker türkçe göstermesi için eklendi
    initializeDateFormatting(); // üst kısım hata vermesin diye eklendi

    return GetMaterialApp(
      // debug yazısını kaldırır
      debugShowCheckedModeBanner: false,
      title: 'Weight Tracker',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      home: const Home(),
    );
  }
}
