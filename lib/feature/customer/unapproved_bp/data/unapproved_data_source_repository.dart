abstract class UnApprovedBpDataSourceRepository {
  Future<List<dynamic>> getBPDetailData(String CardCode);
  Future<List<dynamic>> getCustomerUN_ApprovedData(String db);
  Future<String> updateBPStatusData(String CardCode, String Status);
}
