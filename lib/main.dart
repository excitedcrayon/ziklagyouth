import 'package:flutter/material.dart';
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/pages/MainPage.dart';
import 'package:provider/provider.dart';
import 'package:ziklagyouth/provider/UserNotifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserNotifier()),
      ],
      child: const MyApp(),
    ),
  );
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
