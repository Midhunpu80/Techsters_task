import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techstertask/view/screen/Home/Home.dart';
import 'package:techstertask/view/utility/alltext.dart';
import 'package:techstertask/view/utility/colors.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    splash();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/10.webp'), fit: BoxFit.cover)),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CircleAvatar(
                    radius: 10.h,
                    backgroundImage: const AssetImage(
                        'images/cartoon-illustration-of-open-newspaper-object-clip-art-W2PC34.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  //SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: SizedBox(
                      child: alltext(
                          txt: "Daily News",
                          col: wh,
                          siz: 20.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Center(
                        child: LinearProgressIndicator(
                      backgroundColor: wh,
                      color: re,
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  splash() async {
    await Future.delayed(const Duration(seconds: 6));
    Get.to(Homescreen());
  }
}
