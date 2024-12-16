import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:patch_assignment/app/resources/app_theme.dart';

// ignore: must_be_immutable
class PriceButtons extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  PriceButtons({super.key, required this.buttonText, required this.onPressed, this.isSelected = false});
  bool isSelected;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        isSelected = true;
        onPressed();
      },
      child: Container(
        width: 140.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isSelected? AppTheme.primaryColor: Colors.black26
        ),
        child: Center(
          child: Text(buttonText, style: TextStyle(color: isSelected? Colors.white: Colors.black),),
        ),
      ),
    );
  }
}