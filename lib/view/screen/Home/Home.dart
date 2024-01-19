import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techstertask/main.dart';
import 'package:techstertask/view/utility/alltext.dart';
import 'package:techstertask/view/utility/colors.dart';
import 'package:techstertask/view/widgets/cateogeries.dart';
import 'package:techstertask/view/widgets/reports.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 8.h,
            backgroundColor: blu,
            title: alltext(
                txt: "Flutter Demo App",
                col: wh,
                siz: 15.sp,
                wei: FontWeight.bold,
                max: 1),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                categories(),
                SizedBox(
                  height: 3.h,
                ),
                Obx(
                  () => catogeryReport_controll.data.value.isEmpty
                      ? Center(child: CircularProgressIndicator(),)
                      : Padding(
                          padding: EdgeInsets.only(left: 8.sp),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                  child: alltext(
                                      txt: catogeryReport_controll.data[0]
                                              ['title']
                                          .toString(),
                                      col: blu,
                                      siz: 16.sp,
                                      wei: FontWeight.bold,
                                      max: 1))),
                        ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                reports()
              ],
            ),
          )),
    );
  }
}
