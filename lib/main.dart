import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patch_assignment/app/widgets/my_bottom_nav_bar.dart';
import 'package:provider/provider.dart';


import 'package:patch_assignment/features/home/view_model/product_view_model.dart';
import 'package:patch_assignment/features/home/view/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


void main() {
  WidgetsFlutterBinding();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, __){
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=> ProductViewModel())
          ],
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'SFPRODISPLAY'
            ),
          home: Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: MyBottomNavBar(),
          )
                ),
        );
      },
    );
  }
}
