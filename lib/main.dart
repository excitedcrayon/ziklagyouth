import 'package:flutter/material.dart';
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/pages/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: (Config.production) ? false : true,
      home: SafeArea(
        child: Scaffold(
          body: MainPage(),
        ),
      ),
    );
  }

}
