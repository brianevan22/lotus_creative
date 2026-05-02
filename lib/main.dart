import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const LotusCreativeApp());
}

class LotusCreativeApp extends StatelessWidget {
  const LotusCreativeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotus Creative - Digital Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.gold,
        scaffoldBackgroundColor: AppColors.black,
        fontFamily: 'Inter',
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
