import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/favorite_food_controller.dart';
import 'package:task/features/favorite_feature/widgets/custome_card_food.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favList = Get.find<FavoriteFoodController>().favList;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Set the AppBar height
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 40, right: 40), // Add padding
          child: AppBar(
            title: Text(
              "Favorite list",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/ArrowLeft.png",
                      height: 16,
                      width: 16,
                    )),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: favList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.find<FavoriteFoodController>()
                    .toggleFavorite(favList[index]);
                Get.back();
              },
              child: CustomeCardFood(imagePath: favList[index]),
            );
          },
          shrinkWrap: true,
        ),
      ),
    );
  }
}
