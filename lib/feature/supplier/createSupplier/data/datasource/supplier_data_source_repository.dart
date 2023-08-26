import 'package:dartz/dartz.dart';
import 'package:new_app/core/post_enum_response.dart';

import '../../../../../core/failure.dart';
import '../model/BP_post_1.dart';

abstract class SupplierDataSourceRepository {
  Future<Map<String, int>> getBPSeries_supplier();
  Future<Map<String, int>> getBPGroupCode_supplier();
  Future<Map<String, String>> getBPCurrencies_supplier();
  Future<Map<String, int>> getBPSaleEmployees_supplier();
  Future<Map<String, String>> getBPCountries_supplier();
  Future<List<dynamic>> getBPStates_supplier();
  Future<Map<String, String>> getBPCounty_supplier();
  // Future<List<dynamic>> getApprovalStatusData();

  Future<Either<Failure, PostResponseType>> postBP_master_supplier(
      BP_PostModel_Supplier data);
}
