import 'package:flutter/material.dart';

class CustomeCardFood extends StatelessWidget {
  const CustomeCardFood({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 221, 221).withOpacity(1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 120,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Breakfast Club",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Text("data"),
                    Icon(Icons.star),
                    Text("data"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.motorcycle),
                    Text("ggggg"),
                    // Spacer(),
                    Icon(Icons.favorite)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
