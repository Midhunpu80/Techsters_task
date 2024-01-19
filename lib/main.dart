import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techstertask/controller/selectbutton_controller.dart';
import 'package:techstertask/view/screen/Home/Home.dart';
import 'package:techstertask/view/screen/splashscreen/splashscreen.dart';
import 'package:techstertask/view/service/catogeryReport_service.dart';
import 'package:techstertask/view/service/catogery_service.dart';

void main() {
  runApp(const MyApp());
}

final catogery_controll = Get.put(catogery_service());
final catogeryReport_controll = Get.put(catogeryReport_service());
// ignore: non_constant_identifier_names
final select_controll = Get.put(selectbutton_controller());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Scaffold(body: splashscreen()));
    });
  }
}
