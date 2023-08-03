import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_app/utills/utills.dart';
import 'package:pattern_app/views/screens/details_page.dart';
import 'package:pattern_app/views/screens/home_page.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      initialRoute: '/',
      getPages: [
          GetPage(name: '/', page: ()=>const Homepage()),
          GetPage(name: '/detail_page', page: ()=>const Detail_page()),
      ],
    )
  );
}