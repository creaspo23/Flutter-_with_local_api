import 'package:flutter/material.dart';
import 'package:project1/services/auth.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';

void main() {
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Auth()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
