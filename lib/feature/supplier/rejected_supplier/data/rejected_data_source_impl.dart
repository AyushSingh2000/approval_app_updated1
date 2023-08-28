import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';

import '../data/modal/get_card_detail_model.dart';
import 'rejected_data_source_repository.dart';
import 'modal/get_supplier_rejected_modal.dart';

const DEBUG = true;

class RejectedSupplierDataSourceImpl
    implements RejectedSupplierDataSourceRepository {
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
  Future<List<SupplierDetail_Rejected>> getSupplierRejectedData(
      String db) async {
    try {
      // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
      String URL = URLConst.getSupplierRejectedListURL + db.toString();

      var response = await http.get(
        Uri.parse(URL),
      );
      print(response.body);
      if (response.statusCode == 500) {
        return [];
      }

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        print('|||||||||||||${jsonResponse}');

        final Map<String, dynamic> jsonMap =
            jsonResponse['SupplierList_Reject'];
        final List<SupplierDetail_Rejected> data = jsonMap.values
            .map((entry) => SupplierDetail_Rejected.fromJson(entry))
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
      String URL = URLConst.updateSupplierStatusDataURL + CardCode.toString();

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
