import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/API/URLConst.dart';
import 'package:new_app/core/post_enum_response.dart';

import '../../../../../core/failure.dart';
import '../model/supplier_post_1.dart';
import 'supplier_data_source_repository.dart';

const DEBUG = true;

class SupplierDataSourceImpl implements SupplierDataSourceRepository {
  @override
  Future<Either<Failure, PostResponseType>> postBP_master_supplier(
      BP_PostModel_Supplier data) async {
    try {
      // print(URLConst.baseURL + URLConst.postBP);
      print('Supplier Post Data: ${data.toJson()}');
      const URL = URLConst.postSupplierDataURL;
      var response = await http.post(
        Uri.parse(URL),
        // Uri.parse(''),
        body: data.toJson(),
      );

      print('123456${response.body}');

      if (response.statusCode == 200 || response.statusCode == 202) {
        // ignore: unused_local_variable
        final jsonResponse = jsonDecode(response.body);
        print(response.statusCode);
        if (jsonResponse["Status"] == "failure") {
          print(jsonResponse["Message"]["error"]["message"]);

          return Right(PostResponseType(
              postResponseEnum: PostResponseEnum.failed,
              message: jsonResponse["Message"]["error"]["message"].toString()));
        }

        return Right(PostResponseType(
            postResponseEnum: PostResponseEnum.success, message: "Success"));
      }

      return left(
          Failure(statusCode: response.statusCode, message: 'Server Error'));
    } catch (e) {
      return left(Failure(statusCode: 500, message: e.toString()));
    }
  }

  @override
  Future<Map<String, int>> getBPSeries_supplier() async {
    Map<String, int> data = {};

    try {
      // String URL = URLConst.baseURL + URLConst.getBPSeriesURL;
      String URL = URLConst.getSupplierSeriesListURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['SupplierSeries'];

        resData.forEach((k, v) {
          data[v['SeriesName']] = v['Series'];
        });

        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");

      return data;
    }
  }

  @override
  Future<Map<String, int>> getBPGroupCode_supplier() async {
    Map<String, int> data = {};

    try {
      // const URL = URLConst.baseURL + URLConst.getBPGroupCodeURL;
      const URL = URLConst.getSupplierGroupListURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['SupplierGroup'];

        // resData.forEach((k, v) {
        //   data[v['SeriesName']] = v['Series'];
        // });
        resData.forEach((k, v) {
          data[v['GroupName']] = v['GroupCode'];
        });

        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getgroupcode() \n Response code: ${response.statusCode}");

      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getGroupCode() \n $e");

      return data;
    }
  }

  @override
  Future<Map<String, String>> getBPCurrencies_supplier() async {
    Map<String, String> data = {};

    try {
      String URL = URLConst.baseURL + URLConst.getBPCurrenciesURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Currencies'];

        resData.forEach((k, v) {
          data[v['CurrName']] = v['CurrCode'];
        });

        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");

      return data;
    }
  }

  @override
  Future<Map<String, int>> getBPSaleEmployees_supplier() async {
    Map<String, int> data = {};

    try {
      String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Currencies'];

        resData.forEach((k, v) {
          data[v['SlpName']] = v['SlpCode'];
        });

        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");

      return data;
    }
  }

  // @override
  // Future<List<BpDetail>> getApprovalStatusData() async {
  //   try {
  //     // String URL = URLConst.baseURL + URLConst.getBPSalesEmployeeURL;
  //     String URL = URLConst.getBpMasterApprovalStatusURL;
  //
  //     var response = await http.get(
  //       Uri.parse(URL),
  //     );
  //     print(response.body);
  //
  //     if (response.statusCode == 200 || response.statusCode == 202) {
  //       final jsonResponse = jsonDecode(response.body);
  //       print('|||||||||||||${jsonResponse}');
  //
  //       final Map<String, dynamic> jsonMap = jsonResponse['BPMaster Details'];
  //       final List<BpDetail> data =
  //           jsonMap.values.map((entry) => BpDetail.fromJson(entry)).toList();
  //
  //       return data;
  //     }
  //
  //     if (DEBUG)
  //       print(
  //           "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");
  //
  //     throw Exception('Failed to load approval data');
  //   } catch (e) {
  //     if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");
  //     print(e);
  //     throw Exception('Failed to load approval data');
  //   }
  // }

  @override
  Future<Map<String, String>> getBPCountries_supplier() async {
    Map<String, String> data = {};

    try {
      // String URL = URLConst.baseURL + URLConst.getBPCountryURL;
      String URL = URLConst.getSupplierCountryListURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Currencies'];

        resData.forEach((k, v) {
          data[v['Name']] = v['Code'];
        });
        print(data);
        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");

      return data;
    }
  }

  @override
  Future<List<dynamic>> getBPStates_supplier() async {
    Map<String, String> data = {};
    Map<String, dynamic> temp = {};
    List<dynamic> fullData = [];

    try {
      String URL = URLConst.baseURL + URLConst.getBPStatesURL;

      var response = await http.get(
        Uri.parse(URL),
      );
      print('|||||||||||||||${response.body}');

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Currencies'];
        Map<String, dynamic> tempdata = jsonResponse['Currencies'];

        // temp={
        //
        // }

        resData.forEach((k, v) {
          data[v['Name']] = v['Code'];
        });
        print(data);

        tempdata.keys.forEach((key) {
          fullData.add(tempdata[key]);
        });

        print('|||||||////////////////${fullData}');

        // return data;
        return fullData;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getBPSeries() \n Response code: ${response.statusCode}");

      return fullData;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPSeries() \n $e");

      return fullData;
    }
  }

  Future<Map<String, String>> getBPCounty_supplier() async {
    Map<String, String> data = {};

    try {
      String URL = URLConst.getShipToCounty;
      var response = await http.get(Uri.parse(URL));

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['ShipToCounty'];

        resData.forEach((k, v) {
          data[v['Name']] = v['Code'];
        });
        print("From Ship to County: ");
        print(data);
        return data;
      }
      if (DEBUG) {
        print(
            "Error in Future<Map<String,int>> getBPCounty() \n Response code: ${response.statusCode}");
      }
      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getBPCounty() \n $e");

      return data;
    }

    return data;
  }
}
