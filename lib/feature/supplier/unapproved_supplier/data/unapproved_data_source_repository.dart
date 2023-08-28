abstract class UnApprovedSupplierDataSourceRepository {
  Future<List<dynamic>> getSupplierDetailData(String CardCode);
  Future<List<dynamic>> getSupplierUnapprovedData(String db);
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateSupplierStatusData(String CardCode, String Status);
}
