import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';

import 'approved_data_source_repository.dart';
import 'modal/get_bp_approval_status_modal.dart';
import 'modal/get_bp_details_modal.dart';

const DEBUG = true;

class ApprovedBpDataSourceImpl implements ApprovedBpDataSourceRepository {
  @override
  Future<List<BpDetail>> getApprovalStatusData() async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getBpMasterApprovalStatusURL;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final Map<String, dynamic> jsonMap = jsonResponse['BPMaster Details'];
        final List<BpDetail> data =
            jsonMap.values.map((entry) => BpDetail.fromJson(entry)).toList();

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
}
