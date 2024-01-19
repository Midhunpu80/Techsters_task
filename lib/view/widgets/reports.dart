import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techstertask/main.dart';
import 'package:techstertask/view/utility/Apiurl.dart';
import 'package:techstertask/view/utility/alltext.dart';
import 'package:techstertask/view/utility/colors.dart';

Widget reports() {
  // final version;

  return Obx(() {
    if (catogeryReport_controll.data.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: SizedBox(
            child: alltext(
                txt: "NoData Found",
                col: bl,
                siz: 16.sp,
                wei: FontWeight.bold,
                max: 1)),
      );
    }
    if (catogeryReport_controll.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SizedBox(
          height: 67.h,
          width: 100.w,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 17.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '$baseurl${catogeryReport_controll.data[index]['image']}')),
                        borderRadius: BorderRadius.circular(3.h),
                        color: bl.withOpacity(0.2)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "$baseurl${catogeryReport_controll.data[index]['image']}",
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 5.h,
                        color: re,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: catogeryReport_controll.data.length > 6
                  ? 6
                  : catogeryReport_controll.data.length));
    }
  });
}
