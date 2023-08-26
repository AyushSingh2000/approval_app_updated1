abstract class ApprovedItemDataSourceRepository {
  Future<List<dynamic>> getItemDetailData(String CardCode);
  Future<List<dynamic>> getItemApprovedData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateItemStatusData(String CardCode, String Status);
}
