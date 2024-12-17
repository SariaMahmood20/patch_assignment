import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final String productTitle;
  final String productImageUrl;
  final String productDescription;
  final double productPrice;

  const ProductItem({
    super.key,
    required this.productDescription,
    required this.productImageUrl,
    required this.productPrice,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 137.h,
            width: 170.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productImageUrl, ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            productTitle,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            productDescription,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            textAlign: TextAlign.left,
            maxLines: 2, // Limit to 2 lines
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$${productPrice.toString()}",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
