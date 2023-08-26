import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';

import '../data/modal/get_card_detail_model.dart';
import 'blank_data_source_repository.dart';
import 'modal/get_supplier_blank_modal.dart';

const DEBUG = true;

class BlankSupplierDataSourceImpl implements BlankSupplierDataSourceRepository {
  @override
  Future<List<CardDetail>> getSupplierDetailData(String CardCode) async {
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
  Future<List<SupplierDetail_Blank>> getSupplierBlankData() async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getSupplierBlankListURL;

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final Map<String, dynamic> jsonMap =
            jsonResponse['SupplierList_ApproveBlanks'];
        final List<SupplierDetail_Blank> data = jsonMap.values
            .map((entry) => SupplierDetail_Blank.fromJson(entry))
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

  Future<String> updateSupplierStatusData(
      String CardCode, String Status) async {
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
