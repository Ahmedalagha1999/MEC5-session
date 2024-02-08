import 'package:flutter/material.dart';

class PopularFoodGrid extends StatelessWidget {
  PopularFoodGrid({super.key});
  List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 12,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          width: 165,
          height: 165,
          child: Image.asset(
            fit: BoxFit.cover,
            images[index],
          ),
        );
      },
    );
    ;
  }
}
