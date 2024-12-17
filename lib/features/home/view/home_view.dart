import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:patch_assignment/app/resources/app_strings.dart';
import 'package:patch_assignment/features/home/widget/category_widget.dart';
import 'package:patch_assignment/features/home/widget/price_buttons.dart';
import 'package:patch_assignment/features/home/widget/product_item.dart';
import 'package:patch_assignment/features/home/widget/search_bar_widget.dart';
import 'package:patch_assignment/app/resources/app_theme.dart';
import 'package:patch_assignment/features/home/widget/loading_screen.dart';

import 'package:patch_assignment/features/home/view_model/product_view_model.dart';
import 'package:patch_assignment/app/services/response/status.dart';

class HomeView extends StatelessWidget {
  final searchBarController = TextEditingController();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 50.h,
              width: double.infinity,
              color: AppTheme.primaryColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: SafeArea(
                child: Column(
                  children: [
                    // Search Bar Widget
                    SearchBarWidget(controller: searchBarController),
                    const SizedBox(height: 15),
                    Consumer<ProductViewModel>(
                      builder: (context, productProvider, child) {
                        switch (productProvider.products.status) {
                          case Status.loading:
                            return const LoadingScreen();
                          case Status.failed:
                            return const Center(
                              child: Text("Failed to access data"),
                            );
                          case Status.completed:
                            return Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.chooseFromAnyCategory,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  SizedBox(
                                    height: 130,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productProvider.categories.length,
                                      itemBuilder: (context, index) {
                                        productProvider.getfirstCategoryItem();
                                        final category =
                                            productProvider.categories[index];
                                        return CategoryWidget(
                                          categoryImageUrl: productProvider.categoryImage[index], // Use actual URL if available
                                          categoryName: category,
                                          isSelected: productProvider.selectedCategoryIndex == index,
                                          onPressed: () {
                                            productProvider.getSelectedCategory(category);
                                            productProvider
                                                .sortByCategories(category); // Sort products
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Expanded(
                                    child: Builder(
                                      builder: (_) {
                                        final products = productProvider
                                                    .filteredByCategory.isNotEmpty
                                                ? productProvider.filteredByCategory
                                                : productProvider.products.data!;
                                        if (products.isEmpty) {
                                          return const Center(
                                            child: Text(
                                              "No products available for the selected category.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          );
                                        }
                                        return Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 7.h,),
                                              Text("${products.length} ${AppStrings.productsToChooseFrom}", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),textAlign: TextAlign.left,),
                                              SizedBox(
                                                height: 60.h,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    PriceButtons(
                                                      buttonText: AppStrings.lowestPriceFirst, 
                                                      onPressed: (){productProvider.lowestFirst();},
                                                      isSelected: productProvider.lowest,
                                                    ),
                                                    SizedBox(width: 7.w,),
                                                    PriceButtons(
                                                      buttonText: AppStrings.highestPriceFirst, 
                                                      onPressed: (){productProvider.highestFirst();},
                                                      isSelected: productProvider.highest,
                                                      )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 7.h,),
                                              Expanded(
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 0.8,
                                                  ),
                                                  itemCount: products.length,
                                                  itemBuilder: (context, index) {
                                                    final product = products[index];
                                                    if(searchBarController.text.isNotEmpty){
                                                      if(product.title.contains(searchBarController.text)){
                                                        return ProductItem(
                                                          productDescription: product.description,
                                                          productImageUrl: product.image,
                                                          productPrice: product.price,
                                                          productTitle: product.title,
                                                        );
                                                      }
                                                    }else{
                                                        return ProductItem(
                                                          productDescription: product.description, 
                                                          productImageUrl: product.image, 
                                                          productPrice: product.price, 
                                                          productTitle: product.title
                                                        );
                                                      }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}
