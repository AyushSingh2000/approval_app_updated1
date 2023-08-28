import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../../../../API/URLConst.dart';
import '../../../../../../../core/failure.dart';
import '../datasource/edit_rejected_data_source_repository.dart';

import 'package:http/http.dart' as http;

import '../model/item_series.dart';
import '../model/item_substitution.dart';
import '../model/original_item.dart';

const DEBUG = true;

class EditRejectedItemDataSourceImpl
    implements EditRejectedItemDataSourceRepository {
  @override
  Future<Either<Failure, String>> postItemMaster(
      EditItemModel itemModel) async {
    String temp = "Error";
    try {
      print(itemModel.toJson());
      var response = await http.post(
        Uri.parse(URLConst.postItemMasterDataURL),
        body: itemModel.toJson(),
      );

      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 202) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(response.statusCode);
        if (responseData["Status"].toString() == "failure") {
          if (responseData["Message"]["error"]["message"].toString().isEmpty) {
            temp = responseData["Message"].toString();
          } else {
            temp = responseData["Message"]["error"]["message"].toString();
          }
        }
        if (response.statusCode == 500 &&
            responseData["Error"].toString().isNotEmpty) {
          temp = responseData["Error"].toString();
        }

        if (responseData.containsKey('CardCode')) {
          final String cardCode = responseData['CardCode'] as String;
          final String statuscode = responseData['Status'] as String;
          print('CardCode: $cardCode');
          return Right(cardCode + "@" + "success");
        } else {
          return Right("" + '@' + temp);
        }
      }
      return Left(
          Failure(statusCode: response.statusCode, message: temp.toString()));
    } catch (e) {
      print(e);
      return Left(Failure(statusCode: 500, message: temp.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> postBPCatalog(
      EditItemSubstitutionModel itemSubstitutionModel) async {
    try {
      // const URL = URLConst.baseURL + URLConst.postBPCatalogURL;

      var response = await http.post(Uri.parse(URLConst.postBPCatalogURL),
          body: itemSubstitutionModel.toJson());
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 202) {
        return Right('ok');
      }

      return Left(Failure(statusCode: response.statusCode, message: 'Error'));
    } catch (e) {
      return Left(Failure(statusCode: 500, message: 'Error'));
    }
  }

  @override
  Future<Either<Failure, String>> postAlternativeItem(
      EditOriginalItemModel originalItemModel) async {
    try {
      // const URL = URLConst.baseURL + URLConst.postAlternativeItemURL;

      var response = await http.post(Uri.parse(URLConst.postAlternativeItemURL),
          body: originalItemModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 202) {
        return Right('ok');
      }

      return Left(Failure(statusCode: response.statusCode, message: 'Error'));
    } catch (e) {
      return Left(Failure(statusCode: 500, message: 'Error'));
    }
  }

  @override
  Future<Map<String, int>> getItemSeries() async {
    Map<String, int> data = {};

    try {
      // const URL = URLConst.baseURL + URLConst.getItemSeriesURL;
      const URL = URLConst.getItemSeriesListURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['ItemSeries'];

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
  Future<Map<String, int>> getItemGroup() async {
    Map<String, int> data = {};

    try {
      // const URL = URLConst.baseURL + URLConst.getItemGroupURL;
      const URL = URLConst.getItemGroupListURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['ItemGroup'];

        resData.forEach((k, v) {
          data[v['ItmsGrpNam']] = v['ItmsGrpCod'];
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
  Future<Map<String, int>> getUoM() async {
    Map<String, int> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getUoMURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['UOMEntry'];

        resData.forEach((k, v) {
          data[v['UgpName']] = v['UgpEntry'];
        });

        return data;
      }

      if (DEBUG)
        print(
            "Error in Future<Map<String,int>> getUoM()\n Response code: ${response.statusCode}");

      return data;
    } catch (e) {
      if (DEBUG) print("Error in Future<Map<String,int>> getUoM() \n $e");

      return data;
    }
  }

  @override
  Future<Map<String, String>> getPurchasingUoM() async {
    Map<String, String> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getPurchasingUoMURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['UOM'];

        resData.forEach((k, v) {
          data[v['UomName']] = v['UomCode'];
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
  Future<Map<String, String>> getSalesUoM() async {
    Map<String, String> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getSalesUoMURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['UOM'];

        resData.forEach((k, v) {
          data[v['UomName']] = v['UomCode'];
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
  Future<Map<String, String>> getInventoryUoM() async {
    Map<String, String> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getInventoryUoMURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['UOM'];

        resData.forEach((k, v) {
          data[v['UomName']] = v['UomCode'];
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
  Future<Map<String, String>> getWhseCode() async {
    Map<String, String> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getWhsecodeURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['UOM'];

        resData.forEach((k, v) {
          data[v['WhsName']] = v['WhsCode'];
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
  Future<Map<String, String>> getBPcode() async {
    Map<String, String> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getBPcodeURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['BP Lists'];

        resData.forEach((k, v) {
          data[v['CardName']] = v['CardCode'];
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
  Future<Map<String, String>> getItemNumber() async {
    Map<String, String> data = {};

    try {
      const URL = URLConst.baseURL + URLConst.getItemNumberURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Items Lists'];

        resData.forEach((k, v) {
          data[v['ItemName']] = v['ItemCode'];
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
}
