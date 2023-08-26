abstract class UnApprovedItemDataSourceRepository {
  Future<List<dynamic>> getItemDetailData(String CardCode);
  Future<List<dynamic>> getItemUnApprovedData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateItemStatusData(String CardCode, String Status);
}
