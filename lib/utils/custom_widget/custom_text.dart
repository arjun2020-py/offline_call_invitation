import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key, required this.text,this.color,this.fontSize,this.fontWeight});
  final String text;
   Color? color;
   FontWeight? fontWeight;
   double? fontSize;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight:fontWeight,
        fontSize: fontSize 
      ),
    );
  }
}
