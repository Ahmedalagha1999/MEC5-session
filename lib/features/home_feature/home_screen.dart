import 'package:flutter/material.dart';
import 'package:task/features/home_feature/widgets/custome_search_bar.dart';
import 'package:task/features/home_feature/widgets/food_cateogoeries.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What would you like to order",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: CustomeSearchBar(),
            ),
            Expanded(child: FoodCategories()),
          ],
        ),
      ),
    );
  }
}
