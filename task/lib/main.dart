import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/favorite_food_controller.dart';
import 'package:task/features/details_feature/details_screen.dart';
import 'package:task/features/favorite_feature/favorite_screen.dart';
import 'package:task/features/home_feature/home_screen.dart';
import 'package:task/features/popular_feature/popular_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(
      FavoriteFoodController(),
      permanent: true,
    );
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PopularScreen(),
    );
  }
}
