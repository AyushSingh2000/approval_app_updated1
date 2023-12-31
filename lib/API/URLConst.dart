class URLConst {
  static const baseURL =
      "http://aquachemie.c360.zone:8000/TEKROI_C360/MasterData/";
  static const baseURLHTTPS =
      "https://aquachemie.c360.zone:4300/TEKROI_C360/MasterData/";

  //login
  static const loginURL =
      "http://aquachemie.c360.zone:8000/TEKROI_C360/XSJS/Login.xsjs";

  //BP_Master createCustomer
  static const getBPCurrenciesURL = "BPCurrencies.xsjs?DBName=TESTACAE01";
  static const getBPSalesEmployeeURL = "BPSalesEmployee.xsjs?DBName=TESTACAE01";
  static const getBPCountryURL = "BPCountry.xsjs?DBName=TESTACAE01";
  static const getBPStatesURL = "BPStates.xsjs?DBName=TESTACAE01";

  // static const postBP = "BPMaster.xsjs?DBName=TESTACAE01";

  //Item_Master Items
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

  static const updateItemMasterStatus =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/UpdateItemMaster.xsjs?DBName=TESTACAE01&ItemCode=";

  /// Supplier -------------------------------------------------------

  static const getSupplierBlankListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_ApproveBlank.xsjs?DBName=";

  static const getSupplierUnApprovedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_Un-Approved.xsjs?DBName=";

  static const getSupplierApprovedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_Approved.xsjs?DBName=";

  static const getSupplierRejectedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetSupplierList_Rejected.xsjs?DBName=";

  static const getSupplierSeriesListURL =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/SupplierSeries.xsjs?DBName=TESTAC0718";

  static const getSupplierGroupListURL =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/SupplierGroup.xsjs?DBName=TESTAC0718";

  static const getSupplierCountryListURL =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/Country.xsjs?DBName=TESTAC0718";

  static const postSupplierDataURL =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/PostBPMaster.xsjs?DBName=TESTAC0718";

  static const updateSupplierStatusDataURL =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/UpdateBPMaster.xsjs?DBName=TESTAC0718&CardCode=";

  /// Item -------------------------------------------------------

  static const getItemBlankListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetItemList_ApproveBlank.xsjs?DBName=";

  static const getItemDetailListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetItemMaster_CodePar.xsjs?DBName=TESTAC0718&ItemCode=";

  static const getItemUnApprovedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetItemList_UnApproved.xsjs?DBName=";

  static const getItemApprovedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetItemList_Approved.xsjs?DBName=";

  static const getItemRejectedListURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetItemList_Rejected.xsjs?DBName=";

  static const getItemSeriesListURL =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/ItemSeries.xsjs?DBName=TESTAC0718";

  static const getItemGroupListURL =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/ItemGroup.xsjs?DBName=TESTAC0718";

  static const postItemMasterDataURL =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/PostItemMaster.xsjs?DBName=TESTAC0718";

  static const updateItemStatusDataURL =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/UpdateItemMaster.xsjs?DBName=TESTAC0718&ItemCode=";

  /// Customer ---------------------------------------------------

  static const getCustomerSeries =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/CustomerSeries.xsjs?DBName=TESTAC0718";

  static const getCustomerGroupCode =
      "http://202.65.143.242:8000/TEKROI_C360/SetUpMasters/CustomerGroup.xsjs?DBName=TESTAC0718";

  static const postCustomerDataURL =
      "http://202.65.143.242:8000/TEKROI_C360/PostMasterData/PostBPMaster.xsjs?DBName=TESTAC0718";

  static const getCustomerListBlankURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_ApproveBlank.xsjs?DBName=";

  static const getCustomerListUN_ApprovedURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_Un-Approved.xsjs?DBName=";

  static const getCustomerListApprovedURL2 =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_Approved.xsjs?DBName=";

  static const getCustomerListRejectedURL =
      "http://202.65.143.242:8000/TEKROI_C360/GetMasterData/GetCustomerList_Rejected.xsjs?DBName=";
}
