import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:patch_assignment/app/resources/app_theme.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  final Function onPressed;
  bool isSelected;
  final String categoryImageUrl;
  final String categoryName;

  CategoryWidget(
      {super.key,
      required this.categoryImageUrl,
      required this.categoryName,
      this.isSelected = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 90.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onPressed();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              //Category Image
              child: Container(
                height: 75.h,
                width: 75.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [
                            AppTheme.gradientDarkColor,
                            AppTheme.gradientLightColor
                          ],
                        )
                      : null, // Gradient only if selected
                ),
                child: Padding(
                    padding: EdgeInsets.all(3.w), // Width of the border ring
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundImage: NetworkImage(categoryImageUrl),
                      radius: 37.5.w,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          //Category Title
          Text(
            categoryName,
            style: TextStyle(fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}
