import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:patch_assignment/app/resources/app_strings.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String query) onPressed;
  const SearchBarWidget({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.h,
      child: TextFormField(
        //To shortlist the products based on search query
        onChanged: (value){onPressed(value);},
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: AppStrings.whatAreYouLookingFor,
            hintStyle: TextStyle(fontSize: 15.sp),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
