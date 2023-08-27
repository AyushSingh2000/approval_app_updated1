import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';

import 'approved_data_source_repository.dart';
import 'modal/get_card_detail_model.dart';
import 'modal/get_item_approved_modal.dart';

const DEBUG = true;

class ApprovedItemDataSourceImpl implements ApprovedItemDataSourceRepository {
  @override
  Future<List<ItemDetail>> getItemDetailData(String CardCode) async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getItemDetailListURL + CardCode;

      print("}}}}}}}}${CardCode}");

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final List<dynamic> itemList = jsonResponse;
        final List<ItemDetail> data =
            itemList.map((entry) => ItemDetail.fromJson(entry)).toList();
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
  Future<List<ItemDetail_Approved>> getItemApprovedData() async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getItemApprovedListURL;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final Map<String, dynamic> jsonMap = jsonResponse['ItemList_Approved'];
        final List<ItemDetail_Approved> data = jsonMap.values
            .map((entry) => ItemDetail_Approved.fromJson(entry))
            .toList();

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

  Future<String> updateItemStatusData(String CardCode, String Status) async {
    try {
      String URL = URLConst.updateItemStatusDataURL + CardCode.toString();

      var data = {"U_TRPAPPST": Status};

      print(data);

      var response = await http.patch(Uri.parse(URL), body: jsonEncode(data));

      if (response.statusCode == 200) {
        print('Update successful');
        return "Success";
      } else {
        print('Error: ${response.body}');
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      print('Error: $e');
      return "Error: $e";
    }
  }
}
