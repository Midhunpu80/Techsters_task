import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techstertask/main.dart';
import 'package:techstertask/view/utility/alltext.dart';
import 'package:techstertask/view/utility/colors.dart';

categories() {
  return Obx(
    () => catogery_controll.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: 10.h,
            width: 100.w,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final snap = catogery_controll.reply.records[index];
                  return InkWell(
                    onTap: () {
                      ///////////////////change button color function /////////////////////////
                      select_controll.changebutton(index: index);
                      /////////////////// pass the cateogery id /////////////////////////////////////

                      catogeryReport_controll.getReportcateogery(id: snap.id);
                      print(
                          "${snap.id.toString()}---------------------changed----->");
                    },
                    child: Obx(
                      () => Padding(
                        padding:
                            EdgeInsets.only(top: 2.h, left: 1.h, bottom: 3.h),
                        child: Container(
                          height: 2.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: gy.withOpacity(0.9),
                                    offset: Offset.zero,
                                    blurRadius: 0.2,
                                    spreadRadius: 0.5)
                              ],
                              borderRadius: BorderRadius.circular(10.h),
                              color: select_controll.value.value == index
                                  ? blu
                                  : wh),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: alltext(
                                  txt: snap.category.toString(),
                                  col: select_controll.value.value == index
                                      ? wh
                                      : bl,
                                  siz: 9.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2.h,
                  );
                },
                itemCount: catogery_controll.reply.records.length),
          ),
  );
}
