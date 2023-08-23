abstract class ApprovedBpDataSourceRepository {
  Future<List<dynamic>> getApprovalStatusData();
  Future<List<dynamic>> getBPDetailData(String CardCode);
}
