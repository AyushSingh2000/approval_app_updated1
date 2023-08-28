abstract class ApprovedBpDataSourceRepository {
  Future<List<dynamic>> getApprovalStatusData();
  Future<List<dynamic>> getBPDetailData(String CardCode);
  Future<List<dynamic>> getCustomerApprovedData2(String db);
  Future<List<dynamic>> getCustomerUN_ApprovedData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateBPStatusData(String CardCode, String Status);
}
