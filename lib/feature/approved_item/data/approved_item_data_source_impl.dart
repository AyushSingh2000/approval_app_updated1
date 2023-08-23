import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';

import 'approved_item_data_source_repository.dart';
import 'modal/get_item_approval_status_modal.dart';
import 'modal/get_item_master_details_modal.dart';

const DEBUG = true;

class ApprovedItemDataSourceImpl implements ApprovedItemDataSourceRepository {
  @override
  Future<List<ItemDetail>> getApprovalStatusData() async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getItemMasterApprovalStatusURL;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final Map<String, dynamic> jsonMap = jsonResponse['ItemMaster Details'];
        final List<ItemDetail> data =
            jsonMap.values.map((entry) => ItemDetail.fromJson(entry)).toList();

        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      throw Exception('Failed to load approval data');
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");
      print(e);
      throw Exception('Failed to load approval data');
    }
  }

  @override
  Future<List<ItemDetail_code>> getItemsDetailData(String itemCode) async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getItemMasterDetailsURL + itemCode;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final List<dynamic> itemList = jsonResponse;
        final List<ItemDetail_code> data =
            itemList.map((entry) => ItemDetail_code.fromJson(entry)).toList();
        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      throw Exception('Failed to load approval data');
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");
      print(e);
      throw Exception('Failed to load approval data');
    }
  }
}
