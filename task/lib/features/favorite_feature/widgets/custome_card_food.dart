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
          Container(
            padding: EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFBDBDBD),
            ),
            child: Image.asset(
              fit: BoxFit.cover,
              imagePath,
            ),
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
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("1.4 km"),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.star),
                    Text("4.7  (1.7k)"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(Icons.motorcycle),
                    Text("\$2.00"),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Icon(Icons.favorite),
                    )
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
