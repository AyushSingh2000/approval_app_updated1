import 'package:dartz/dartz.dart';
import 'package:new_app/core/post_enum_response.dart';

import '../../../../../core/failure.dart';
import '../model/BP_post_1.dart';

abstract class CustomerDataSourceRepository {
  Future<Map<String, int>> getBPSeries();
  Future<Map<String, int>> getBPGroupCode();
  Future<Map<String, String>> getBPCurrencies();
  Future<Map<String, int>> getBPSaleEmployees();
  Future<Map<String, String>> getBPCountries();
  Future<List<dynamic>> getBPStates();
  Future<Map<String, String>> getBPCounty();
  // Future<List<dynamic>> getApprovalStatusData();

  Future<Either<Failure, PostResponseType>> postBP_master(
      BP_PostModel_test data);
}
