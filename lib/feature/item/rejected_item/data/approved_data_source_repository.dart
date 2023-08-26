abstract class RejectedItemDataSourceRepository {
  Future<List<dynamic>> getItemDetailData(String CardCode);
  Future<List<dynamic>> getItemRejectedData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateItemStatusData(String CardCode, String Status);
}
