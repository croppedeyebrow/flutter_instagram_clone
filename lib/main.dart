import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_instagram_clone/auth/auth_screen.dart';
import 'package:flutter_instagram_clone/firebase_options.dart';
import 'package:flutter_instagram_clone/screen/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 1번코드
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform); // 2번코드
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '인스타그램 클론',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScreenUtilInit(
          designSize: Size(375, 812), child: const AuthPage()),
    );
  }
}
