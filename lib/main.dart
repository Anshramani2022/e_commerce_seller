import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme:
              const AppBarTheme(color: Colors.transparent, elevation: 0.0)),
      home: const LoginScreen(),
    );
  }
}
