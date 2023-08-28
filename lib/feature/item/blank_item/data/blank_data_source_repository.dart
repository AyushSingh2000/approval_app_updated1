abstract class BlankItemDataSourceRepository {
  Future<List<dynamic>> getItemDetailData(String CardCode);
  Future<List<dynamic>> getItemBlankData(String db);
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateSupplierStatusData(String CardCode, String Status);
}
