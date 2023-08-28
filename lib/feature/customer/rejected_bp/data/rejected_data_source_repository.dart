abstract class RejectedBpDataSourceRepository {
  Future<List<dynamic>> getBPDetailData(String CardCode);
  Future<List<dynamic>> getCustomerRejectedData(String db);
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateBPStatusData(String CardCode, String Status);
}
