abstract class ApprovedSupplierDataSourceRepository {
  Future<List<dynamic>> getSupplierDetailData(String CardCode);
  Future<List<dynamic>> getSupplierApprovedData(String db);
  // Future<List<dynamic>> getApprovalStatusData();
  Future<String> updateSupplierStatusData(String CardCode, String Status);
}
