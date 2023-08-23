import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:new_app/feature/items/data/datasource/item_data_source_repository.dart';

import '../../../../API/URLConst.dart';
import 'package:http/http.dart' as http;

import '../../../../core/failure.dart';
import '../model/item_series.dart';
import '../model/item_substitution.dart';
import '../model/original_item.dart';

const DEBUG = true;

class ItemDataSourceImpl implements ItemDataSourceRepository {
  
  @override
  Future<Either<Failure, String>> postItemMaster(ItemModel itemModel) async {
    try {
      print(itemModel.toJson());
      var response = await http.post(
        Uri.parse(URLConst.postItemMasterURL),
        body: itemModel.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(response.body);
        // itemsController.catalog_status.value =
        //     responseData['Status'].toString();
        // print('hello${itemsController.catalog_status.value}');

        if (responseData.containsKey('CardCode')) {
          final String cardCode = responseData['CardCode'] as String;
          final String statuscode = responseData['Status'] as String;
          print('CardCode: $cardCode');
          return Right(cardCode+"@"+statuscode);
        } else {
          return Left(Failure(
            statusCode: 500,
            message: 'Response does not contain CardCode',
          ));
        }
      }

      return Left(Failure(statusCode: response.statusCode, message: 'Error'));
    } catch (e) {
      print(e);
      return Left(Failure(statusCode: 500, message: 'Error'));
    }
  }

  @override
  Future<Either<Failure, String>> postBPCatalog(
      ItemSubstitutionModel itemSubstitutionModel) async {
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
      OriginalItemModel originalItemModel) async {
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
      const URL = URLConst.baseURL + URLConst.getItemSeriesURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Series'];

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
      const URL = URLConst.baseURL + URLConst.getItemGroupURL;

      var response = await http.get(
        Uri.parse(URL),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        var resData = jsonResponse['Series'];

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
