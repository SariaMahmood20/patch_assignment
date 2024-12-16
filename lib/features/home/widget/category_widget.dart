import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatefulWidget {
  final String categoryName;
  final String categoryImageUrl;
  final Function onPressed;
  bool isSelected;
  CategoryWidget({super.key, required this.categoryImageUrl, required this.categoryName, required this.onPressed, this.isSelected = false});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {


  void _toggleSelection(){
    setState(() {
      widget.isSelected = !widget.isSelected;
    });
  }

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
            onTap: (){
              _toggleSelection();
              widget.onPressed();
            },
            child: Container(
              height: 75.h,
              width: 75.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                image: DecorationImage(image: NetworkImage(widget.categoryImageUrl), fit: BoxFit.scaleDown),
                border: widget.isSelected? Border.all(color: Colors.blue): null
              ),
            ),
          ),
          SizedBox(height: 7.h,),
          Text(widget.categoryName, style: TextStyle(fontSize: 10.sp),)
        ],
      ),
    );
  }
}