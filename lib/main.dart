import 'package:flutter/material.dart';

import 'views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API fetch',
      theme: ThemeData(
        primaryColor: const Color(0xff1E4C59),
      ),
      home: const HomePage(),
    );
  }
}
