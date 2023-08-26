abstract class RejectedBpDataSourceRepository {
  Future<List<dynamic>> getBPDetailData(String CardCode);
  Future<List<dynamic>> getCustomerRejectedData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateBPStatusData(String CardCode, String Status);
}
