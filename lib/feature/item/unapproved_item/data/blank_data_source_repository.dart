abstract class UnApprovedItemDataSourceRepository {
  Future<List<dynamic>> getItemDetailData(String CardCode);
  Future<List<dynamic>> getItemUnApprovedData(String db);
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateItemStatusData(String CardCode, String Status);
}
