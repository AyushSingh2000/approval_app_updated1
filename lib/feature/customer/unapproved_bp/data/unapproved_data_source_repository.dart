abstract class UnApprovedBpDataSourceRepository {
  Future<List<dynamic>> getBPDetailData(String CardCode);
  Future<List<dynamic>> getCustomerUN_ApprovedData();
  Future<String> updateBPStatusData(String CardCode, String Status);
}
