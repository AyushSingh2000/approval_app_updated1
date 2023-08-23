abstract class ApprovedItemDataSourceRepository {
  Future<List<dynamic>> getApprovalStatusData();
  Future<List<dynamic>> getItemsDetailData(String itemCode);
}
