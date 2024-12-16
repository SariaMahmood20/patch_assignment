import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:patch_assignment/features/home/view_model/product_view_model.dart';
import 'package:patch_assignment/features/home/view/home_view.dart';
import 'view.dart';

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
          home: Scaffold(
            body: HomeView(),
          )
                ),
        );
      },
    );
  }
}
