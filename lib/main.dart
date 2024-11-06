import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/features/auth/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final designSize = Size(constraints.maxWidth, constraints.maxHeight);
        return ScreenUtilInit(
          designSize: designSize,
          builder: (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Travel App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
