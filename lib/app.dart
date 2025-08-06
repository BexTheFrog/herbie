//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:herbie/pages/home_page.dart';

class Herbie extends StatelessWidget {
  const Herbie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
    home: HomePage(),
    );
  }
}
