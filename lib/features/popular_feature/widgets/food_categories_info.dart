import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants.dart';
import 'package:task/controllers/favorite_food_controller.dart';
import 'package:task/features/details_feature/details_screen.dart';

class FoodCategoriesInfo extends StatefulWidget {
  const FoodCategoriesInfo(
      {super.key, required this.imagePath, required this.index});
  final String imagePath;
  final int index;

  @override
  State<FoodCategoriesInfo> createState() => _FoodCategoriesInfoState();
}

class _FoodCategoriesInfoState extends State<FoodCategoriesInfo> {
  final ValueNotifier<bool> isFavoritedNotifier = ValueNotifier<bool>(false);
  final controller = Get.find<FavoriteFoodController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        isFavoritedNotifier.value = controller.isFavorited(widget.imagePath);
        return InkWell(
          onTap: () => Get.to(
            () => DetailsScreen(
              imagePath: widget.imagePath,
              index: widget.index,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  width: 1,
                  color: borderColor,
                )),
            child: ValueListenableBuilder(
              valueListenable: isFavoritedNotifier,
              builder: (context, isFavorited, child) => Column(
                children: [
                  if (isFavorited) Text("Pakistan Food"),
                  if (!isFavorited)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Hero(
                          tag: widget.index,
                          child: Image.asset(
                            widget.imagePath,
                            width: 48,
                            height: 48,
                          ),
                        ),
                        Text("12min")
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FoodBase"),
                        Icon(Icons.favorite),
                      ],
                    ),
                  SizedBox(
                    height: 12,
                  ),
                  if (isFavorited)
                    Image.asset(
                      widget.imagePath,
                      width: 106,
                      height: 106,
                    ),
                  SizedBox(
                    height: 12,
                  ),
                  if (!isFavorited)
                    Text(
                      "Pieces Chicken",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    )
                  else
                    Row(
                      children: [
                        Text("24mins"),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.star),
                        Text("4.5"),
                      ],
                    ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$8.88"),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
