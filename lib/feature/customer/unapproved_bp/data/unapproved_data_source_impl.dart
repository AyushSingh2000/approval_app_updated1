import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';

import 'unapproved_data_source_repository.dart';
import 'modal/get_bp_details_modal.dart';
import 'modal/get_customer_un_approved_modal.dart';

const DEBUG = true;

class UnApprovedBpDataSourceImpl implements UnApprovedBpDataSourceRepository {
  @override
  Future<List<CardDetail>> getBPDetailData(String CardCode) async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getBPMasterDetailsURL + CardCode;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final List<dynamic> itemList = jsonResponse;
        final List<CardDetail> data =
            itemList.map((entry) => CardDetail.fromJson(entry)).toList();
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
  Future<List<BpDetail_UN>> getCustomerUN_ApprovedData() async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getCustomerListUN_ApprovedURL;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final Map<String, dynamic> jsonMap =
            jsonResponse['CustomerList_UnApproved'];
        final List<BpDetail_UN> data =
            jsonMap.values.map((entry) => BpDetail_UN.fromJson(entry)).toList();

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

  Future<String> updateBPStatusData(String CardCode, String Status) async {
    try {
      String URL = URLConst.updateBPMasterStatus + CardCode.toString();

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
