import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:techstertask/model/catogeryReportmodel.dart';
import 'package:techstertask/view/utility/apiconfigration.dart';

class catogeryReport_service extends GetxController {
  Apiconfigration api = Apiconfigration();
  RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> recordss = [];

  var isLoading = false.obs;
  late CatogeryReportModel reply;

  getReportcateogery({required var id}) async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('${api.categoryReport_End}category_id=$id'));
      if (response.statusCode == 200) {
        
        data.clear();

        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<Map<String, dynamic>> records =
            List<Map<String, dynamic>>.from(id.toString() == 1.toString()
                ? responseData['records']['2023']
                : responseData['records']['2022']);
        data.assignAll(records);

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
    await getReportcateogery(id: 1.toString());

    super.onInit();
  }
}
