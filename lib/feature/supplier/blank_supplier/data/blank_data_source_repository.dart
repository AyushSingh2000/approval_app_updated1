abstract class BlankSupplierDataSourceRepository {
  Future<List<dynamic>> getSupplierDetailData(String CardCode);
  Future<List<dynamic>> getSupplierBlankData(String db);
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateSupplierStatusData(String CardCode, String Status);
}
