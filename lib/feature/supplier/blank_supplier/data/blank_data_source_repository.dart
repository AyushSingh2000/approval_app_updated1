abstract class BlankSupplierDataSourceRepository {
  Future<List<dynamic>> getSupplierDetailData(String CardCode);
  Future<List<dynamic>> getSupplierBlankData();
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateSupplierStatusData(String CardCode, String Status);
}
