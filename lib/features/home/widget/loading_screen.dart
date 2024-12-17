import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Shimmer effect
    return Expanded(
      child: Skeletonizer(
        containersColor: Colors.black45,
        effect: const ShimmerEffect(
          baseColor: Colors.black38,
          highlightColor: Colors.black12,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          duration: Duration(seconds: 2),
        ),
        enabled: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Placeholder
                Container(
                  height: 24.h,
                  width: 200.w,
                  color: Colors.black38,
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 130.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 100.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 24.h,
                  width: 250.w,
                  color: Colors.black38,
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 60.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40.h,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: 40.h,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.black38,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100.h,
                            width: double.infinity,
                            color: Colors.black45,
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 16.h,
                            width: 120.w,
                            color: Colors.black45,
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            height: 20.h,
                            width: 80.w,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
