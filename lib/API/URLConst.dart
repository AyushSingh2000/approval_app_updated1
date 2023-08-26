class URLConst {
  static const baseURL =
      "http://aquachemie.c360.zone:8000/TEKROI_C360/MasterData/";
  static const baseURLHTTPS =
      "https://aquachemie.c360.zone:4300/TEKROI_C360/MasterData/";

  //login
  static const loginURL =
      "http://aquachemie.c360.zone:8000/TEKROI_C360/XSJS/Login.xsjs";

  //BP_Master createCustomer
  static const getBPSeriesURL = "BPSeries.xsjs?DBName=TESTACAE01";
  static const getBPGroupCodeURL = "BPGroupCode.xsjs?DBName=TESTACAE01";
  static const getBPCurrenciesURL = "BPCurrencies.xsjs?DBName=TESTACAE01";
  static const getBPSalesEmployeeURL = "BPSalesEmployee.xsjs?DBName=TESTACAE01";
  static const getBPCountryURL = "BPCountry.xsjs?DBName=TESTACAE01";
  static const getBPStatesURL = "BPStates.xsjs?DBName=TESTACAE01";

  // static const postBP = "BPMaster.xsjs?DBName=TESTACAE01";
  static const postBP =
      "http://202.65.143.242:8000/TEKROI_C360/MasterData/BPMaster.xsjs?DBName=TESTACAE01";

  //Item_Master Items
  static const getItemSeriesURL = "ItemSeries.xsjs?DBName=TESTACAE01";
  static const getItemGroupURL = "ItemSeries.xsjs?DBName=TESTACAE01";
  static const getUoMURL = "ItemUOMEntry.xsjs?DBName=TESTACAE01";
  static const getPurchasingUoMURL = "ItemPurSaleUOM.xsjs?DBName=TESTACAE01";
  static const getSalesUoMURL = "ItemPurSaleUOM.xsjs?DBName=TESTACAE01";
  static const getInventoryUoMURL = "ItemPurSaleUOM.xsjs?DBName=TESTACAE01";
  static const getWhsecodeURL = "ItemWarehouses.xsjs?DBName=TESTACAE01";
  static const getBPcodeURL = "BPCodes.xsjs?DBName=TESTACAE01";
  static const getItemNumberURL = "ItemsList.xsjs?DBName=TESTACAE01";

  static const getBpMasterApprovalStatusURL =
      "http://202.65.143.242:8000/TEKROI_C360/MasterApprovals/BPMasterApprovalStatus.xsjs?DBName=TESTACAE01&CardType=C";

  static const getItemMasterApprovalStatusURL =
      "http://202.65.143.242:8000/TEKROI_C360/MasterApprovals/ItemMasterApprovalStatus.xsjs?DBName=TESTACAE01";

  static const getItemMasterDetailsURL =
      "http://202.65.143.242:8000/TEKROI_C360/MasterData/GetItemMaster.xsjs?DBName=TESTACAE01&ItemCode=";

  static const getBPMasterDetailsURL =
      "http://202.65.143.242:8000/TEKROI_C360/MasterData/GetBPMaster.xsjs?DBName=TESTACAE01&CardCode=";

  // static const postItemMasterURL =
  //     "https://aquachemie.c360.zone:4300/TEKROI_C360/MasterData/ItemMaster.xsjs?DBName=TESTACAE01";
  static const postItemMasterURL =
      "https://202.65.143.242:4300/TEKROI_C360/MasterData/ItemMaster.xsjs?DBName=TESTACAE01";
  // static const postAlternativeItemURL =
  //     "AlternativeItems.xsjs?DBName=TESTACAE01";

  static const postAlternativeItemURL =
      "https://202.65.143.242:4300/TEKROI_C360/MasterData/AlternativeItems.xsjs?DBName=TESTACAE01";

  // static const postBPCatalogURL = "BPCatalogNumber.xsjs?DBName=TESTACAE01";

  static const postBPCatalogURL =
      "https://202.65.143.242:4300/TEKROI_C360/MasterData/BPCatalogNumber.xsjs?DBName=TESTACAE01";

  static const getShipToCounty =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/ShipToCounty.xsjs?DBName=TESTACAE01";

  static const updateBPMasterStatus =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/UpdateBPMaster.xsjs?DBName=TESTAC0718&CardCode=";

  static const getCustomerListApprovedURL2 =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_Approved.xsjs?DBName=TESTAC0718";

  static const getCustomerListUN_ApprovedURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_Un-Approved.xsjs?DBName=TESTAC0718";

  static const getCustomerListBlankURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_ApproveBlank.xsjs?DBName=TESTAC0718";

  static const getCustomerListRejectedURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_Rejected.xsjs?DBName=TESTAC0718";

  /// Supplier -------------------------------------------------------

  static const getSupplierBlankListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_ApproveBlank.xsjs?DBName=TESTAC0718";

  static const getSupplierUnApprovedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_Un-Approved.xsjs?DBName=TESTAC0718";

  static const getSupplierApprovedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_Approved.xsjs?DBName=TESTAC0718";

  static const getSupplierRejectedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_Rejected.xsjs?DBName=TESTAC0718";
}
