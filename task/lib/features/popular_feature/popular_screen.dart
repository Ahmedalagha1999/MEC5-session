import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/features/favorite_feature/favorite_screen.dart';
import 'package:task/features/home_feature/widgets/custome_search_bar.dart';
import 'package:task/features/home_feature/widgets/food_cateogoeries.dart';
import 'package:task/features/popular_feature/widgets/food_categories_info.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: TextButton(
                child: Text("Favorite"),
                onPressed: () => Get.to(() => FavoriteScreen()),
              ),
            ),
          ],
        ),
      ),
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
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2, // Number of items in the cross axis
                  mainAxisSpacing:
                      10.0, // Spacing between items in the main axis
                  crossAxisSpacing:
                      10.0, // Spacing between items in the cross axis
                ),
                itemBuilder: (context, index) {
                  return FoodCategoriesInfo(
                    imagePath: 'assets/images/Image${index + 1}.png',
                    index: index,
                  );
                },
                itemCount: 4,
              ),
            )
            // FoodCategoriesInfo(),
          ],
        ),
      ),
    );
  }
}
