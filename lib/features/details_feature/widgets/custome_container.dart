import 'package:flutter/material.dart';

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, required this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Color(0xFFEAEAEA))),
      child: Text(title),
    );
  }
}
