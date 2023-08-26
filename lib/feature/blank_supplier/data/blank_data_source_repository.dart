abstract class BlankBpDataSourceRepository {
  Future<List<dynamic>> getBPDetailData(String CardCode);
  Future<List<dynamic>> getCustomerBlankData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateBPStatusData(String CardCode, String Status);
}
