import 'package:flutter/material.dart';
import 'package:space_element/screens/home_screen.dart';
import 'package:space_element/screens/zoom_screen.dart';
import 'package:space_element/utils/colors.dart';
import 'package:space_element/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return MaterialApp(
      title: 'SpaceElement',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: ZoomScreen(),
    );
  }
}
