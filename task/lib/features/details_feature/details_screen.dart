import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/favorite_food_controller.dart';
import 'package:task/features/details_feature/widgets/custome_container.dart';
import 'package:task/features/favorite_feature/favorite_screen.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.imagePath, required this.index})
      : super(key: key);
  final String imagePath;
  final int index;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var myFavIcon = Icon(Icons.favorite);
  @override
  void initState() {
    super.initState();
    ever(Get.find<FavoriteFoodController>().favList, (_) {
      setMyFavIcon();
    });
    setMyFavIcon(); // Initialize the icon color
  }

  void setMyFavIcon() {
    if (this.mounted) {
      setState(() {
        myFavIcon = Icon(
          Icons.favorite,
          color:
              Get.find<FavoriteFoodController>().isFavorited(widget.imagePath)
                  ? Colors.red
                  : null,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Set the AppBar height
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 40, right: 40), // Add padding
          child: AppBar(
            title: Text(
              "Details",
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
                  ),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  final controller = Get.find<FavoriteFoodController>();
                  if (controller.isFavorited(widget.imagePath)) {
                    controller.toggleFavorite(widget.imagePath);
                    setMyFavIcon(); // Update the icon color
                  } else {
                    controller.toggleFavorite(widget.imagePath);
                    setMyFavIcon(); // Update the icon color
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Color(0xFFEAEAEA))),
                  child: myFavIcon,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: widget.index,
              child: Container(
                height: 245,
                width: 230,
                child: Image.asset(
                  fit: BoxFit.fitHeight,
                  widget.imagePath,
                  // width: 245,
                  // height: 245,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.timer_sharp,
                ),
                Text("24mins"),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.star),
                Text("4.5"),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.local_fire_department),
                Text("424Kcal"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomeContainer(
                  title: "small",
                ),
                CustomeContainer(
                  title: "Medium",
                ),
                CustomeContainer(
                  title: "large",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shrimp Pasta",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                Container(
                  width: 120,
                  height: 44,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 211, 212).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.remove,
                        size: 15,
                      ),
                      Text("2"),
                      Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              "Ingradients",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomeContainer(
                  title: "🌾 Black Pasta",
                ),
                CustomeContainer(
                  title: "🍤 Shrimp",
                ),
                CustomeContainer(
                  title: "🍅 Tomato",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$10.49"),
                Container(
                  alignment: Alignment.center,
                  width: 233,
                  height: 49,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
