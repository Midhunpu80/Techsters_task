import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:techstertask/model/cateogeryModel.dart';
import 'package:techstertask/view/utility/apiconfigration.dart';

class catogery_service extends GetxController {
  Apiconfigration api = Apiconfigration();

  var isLoading = false.obs;
  late CatogeryModel reply;

  getcateogery() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(api.categoryEnd));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        /// print(response.body.toString());

        reply = CatogeryModel.fromJson(data);
        print(
            "${reply.records.map((e) => e.id.toString()).toList()}-----------------------------sucesss");
        isLoading(false);
      } else {
        print("failed");
        isLoading(false);
      }
    } catch (e) {
      print(e.toString());
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    await getcateogery();

    super.onInit();
  }
}
