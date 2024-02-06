import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        labelStyle: TextStyle(color: labelTextColor, fontSize: 15),
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.all(16),
        labelText: "search your food",
        fillColor: filledform,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
