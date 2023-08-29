import 'dart:convert';

import 'package:get/get.dart';
import '../data/datasource/item_data_source_impl.dart';
import '../data/model/item_series.dart';
import '../data/model/item_substitution.dart';
import 'package:new_app/feature/item/createItem/data/model/original_item.dart';
import 'package:http/http.dart' as http;
import '../../../../core/post_enum_response.dart';

class ItemsController extends GetxController {
  ItemDataSourceImpl itemDataSourceImpl = ItemDataSourceImpl();

  var itemSeriesMapData = {}.obs;
  var itemSeriesList = <String>[].obs;

  var itemGroupMapData = {}.obs;
  var itemGroupList = <String>[].obs;

  var UoMMapData = {}.obs;
  var UoMList = <String>[].obs;

  var PurchasingUoMMapData = {}.obs;
  var PurchasingUoMList = <String>[].obs;

  var SalesUoMMapData = {}.obs;
  var SalesUoMList = <String>[].obs;

  var InventoryUoMMapData = {}.obs;
  var InventoryUoMList = <String>[].obs;

  var WhseMapData = {}.obs;
  var WhseList = [].obs;

  var BPdataMapData = {}.obs;
  var BPdataList = [].obs;

  var itemNumberMapData = {}.obs;
  var itemNumberList = [].obs;

  var itemcode = ''.obs;

  // ... (other controller logic)
  //main
  var Item_Series = ''.obs;
  var Item_Name = ''.obs;
  var Foreign_Name = ''.obs;
  var Item_Type = ''.obs;
  var Item_Group = ''.obs;
  var Item_Group_Code = 0.obs;
  RxBool Inventory_Item = true.obs;
  RxBool Sales_Item = true.obs;
  RxBool Purchase_Item = true.obs;
  var UoM = ''.obs;
  var UoM_code = 0.obs;
  var Purchasing_UoM = ''.obs;
  var Purchasing_UoM_code = 0.obs;
  var Sales_UoM = ''.obs;
  var Sales_UoM_code = 0.obs;
  var Inventory_UoM = ''.obs;
  var Inventory_UoM_code = 0.obs;
  var Mfr_Catalog_No = ''.obs;
  var Manage_Item_by = ''.obs;
  var Management_Method = ''.obs;
  var Valuation_Method = ''.obs;
  var Additional_Identifier = ''.obs;
  var HS_Code = ''.obs;
  var Classification_No = ''.obs;
  var Procurement_Method = ''.obs;
  var DG_Type = ''.obs;
  var Status = ''.obs;
  var Min_Inventory = ''.obs;
  var Max_Inventory = ''.obs;

  //item warehouse

  var Whse_Code = ''.obs;
  var Whse_Name = ''.obs;
  var In_Stock = ''.obs;
  var Committed = ''.obs;
  var Ordered = ''.obs;

  //bp_catalog numbers
  var BP_Code = ''.obs;
  var BP_Name = ''.obs;
  var BP_Catalog_No = ''.obs;
  var Is_Default = ''.obs;
  var BP_Catalog_Description = ''.obs;
  var Technical_Specification = ''.obs;

  //alternativeitems
  var Item_No = ''.obs;
  var Item_Name_alt = ''.obs;
  var Item_Description = ''.obs;
  var Match_Factor = ''.obs;
  var Remark_ = ''.obs;

  var catalog_status = ''.obs;
  var Item_Group_Name = ''.obs;
  var bp_catalog_status = ''.obs;
  var alternative_status = ''.obs;
  var initialDataLoading = false.obs;
  var postItemMasterLoading = false.obs;
  var postBPCatalogueLoading = false.obs;
  var postAlternativeItemLoading = false.obs;

  var cardCode = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    // initialDataLoading.value = true;

    await getItemSeries();
    await getItemGroup();
    await getUom();
    await getPurchasingUoM();
    await getSalesUoM();
    await getInventoryUoM();
    await getWhseCode();
    await getBPcode();
    await getItemNumber();

    // initialDataLoading.value = false;
  }

  Future<void> getItemSeries() async {
    try {
      final data = await itemDataSourceImpl.getItemSeries();
      itemSeriesMapData.value = data;
      itemSeriesList.value = data.keys.toList();
      print('Item List');
      print('zxcvbnvccvbn${itemSeriesMapData}');
      // print(itemSeriesList.value);
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getItemGroup() async {
    try {
      final data = await itemDataSourceImpl.getItemGroup();
      itemGroupMapData.value = data;
      itemGroupList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getUom() async {
    try {
      final data = await itemDataSourceImpl.getUoM();
      UoMMapData.value = data;
      UoMList.value = data.keys.toList();

      print('qwertyui${UoMMapData}');
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getPurchasingUoM() async {
    try {
      final data = await itemDataSourceImpl.getPurchasingUoM();
      PurchasingUoMMapData.value = data;

      PurchasingUoMList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getSalesUoM() async {
    try {
      final data = await itemDataSourceImpl.getSalesUoM();
      SalesUoMMapData.value = data;
      SalesUoMList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getInventoryUoM() async {
    try {
      final data = await itemDataSourceImpl.getInventoryUoM();
      InventoryUoMMapData.value = data;
      //
      InventoryUoMList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getWhseCode() async {
    try {
      final data = await itemDataSourceImpl.getWhseCode();
      WhseMapData.value = data;
      WhseList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getBPcode() async {
    try {
      final data = await itemDataSourceImpl.getBPcode();
      BPdataMapData.value = data;
      BPdataList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future getItemNumber() async {
    try {
      final data = await itemDataSourceImpl.getItemNumber();
      itemNumberMapData.value = data;
      print(itemNumberMapData);
      itemNumberList.value = data.keys.toList();
    } catch (e) {
      print("Error in getItemSeries : $e");
    }
  }

  Future postItemMaster() async {
    postItemMasterLoading.value = true;
    PostResponseType result =
        PostResponseType(postResponseEnum: PostResponseEnum.error);

    try {
      // dynamic data

      ItemModel itemModel = ItemModel(
        Series: Item_Series.value,
        ItemName: Item_Name.value,
        ForeignName: Foreign_Name.value,
        ItemsGroupCode: Item_Group_Code.value,
        ItemType: 'I',
        PurchaseItem: Purchase_Item.value == true ? "tYES" : "tNO",
        SalesItem: Sales_Item.value == true ? "tYES" : "tNO",
        InventoryItem: Inventory_Item.value == true ? "tYES" : "tNO",
        UoMGroupEntry: int.parse(UoM_code.value.toString()),
        // InventoryUoMEntry: Inventory_UoM_code.value,
        InventoryUoMEntry: 340,
        // DefaultSalesUoMEntry: Sales_UoM_code.value,
        DefaultSalesUoMEntry: 340,
        // DefaultPurchasingUoMEntry: Purchasing_UoM_code.value,
        DefaultPurchasingUoMEntry: 340,
        SupplierCatalogNo: Mfr_Catalog_No.value,
        Manufacturer: -1,
        ManageSerialNumbers: Manage_Item_by.value,
        ManageBatchNumbers: Manage_Item_by.value,
        SRIAndBatchManageMethod: Management_Method.value,
        CostAccountingMethod: Valuation_Method.value,
        SWW: Additional_Identifier.value,
        U_TRPHSC: HS_Code.value,
        U_TRPAPPST: Status.value,
        U_VSPPC: Classification_No.value,
        ProcurementMethod: Procurement_Method.value,
        U_TRPITMGP: DG_Type.value,
      );

      // ItemModel itemModel = ItemModel(
      //   Series: "68",
      //   ItemName: "2-Ethyl Hexanol_TEST",
      //   ForeignName: "null",
      //   ItemsGroupCode: 105,
      //   ItemType: "itItems",
      //   PurchaseItem: "tYES",
      //   SalesItem: "tYES",
      //   InventoryItem: "tYES",
      //   UoMGroupEntry: 933,
      //   InventoryUoMEntry: 340,
      //   DefaultSalesUoMEntry: 340,
      //   DefaultPurchasingUoMEntry: 340,
      //   SupplierCatalogNo: "null",
      //   Manufacturer: -1,
      //   ManageSerialNumbers: "tYES",
      //   ManageBatchNumbers: "tNO",
      //   SRIAndBatchManageMethod: "bomm_OnEveryTransaction",
      //   CostAccountingMethod: "bis_SNB",
      //   SWW: "Commodity",
      //   U_TRPHSC: "null",
      //   MaxInventory: 0.0,
      //   MinInventory: 0.0,
      //   U_TRPAPPST: "Un-Approved",
      //   U_VSPPC: "null",
      //   ProcurementMethod: "B",
      //   U_TRPITMGP: "DG",
      // );

      print('Req body: ${itemModel.toJson()}');
      var res = await itemDataSourceImpl.postItemMaster(itemModel);
      print('qwertrsasdfgg${res}');

      res.fold((failure) {
        cardCode.value = '';
        print('qwertyuio${failure.message}');
      }, (r) {
        print("Success");
        cardCode.value = r.substring(0, r.indexOf('@'));
        catalog_status.value = r.substring(r.indexOf('@') + 1);

        print('ji${cardCode.value}');
        print('ji${catalog_status.value}');
        result = PostResponseType(postResponseEnum: PostResponseEnum.success);
      });
    } catch (e) {
      print(e);
    }

    postItemMasterLoading.value = false;
    return result;
  }

  Future postBPCatalogue() async {
    postBPCatalogueLoading.value = true;
    PostResponseType result =
        PostResponseType(postResponseEnum: PostResponseEnum.error);

    try {
      ItemSubstitutionModel itemSubstitutionModel = ItemSubstitutionModel(
          CardCode: BP_Code.value,
          DisplayBPCatalogNumber: 'Y',
          ItemCode: itemcode.value,
          Substitute: '1536510',
          U_VSPBPD: '',
          U_VSPTS: '');

      var res = await itemDataSourceImpl.postBPCatalog(itemSubstitutionModel);

      res.fold((failure) {
        print(failure.message);
      }, (r) {
        print("Success");
        bp_catalog_status.value = r;
        print(r + '1');
        result = PostResponseType(postResponseEnum: PostResponseEnum.success);
      });
    } catch (e) {
      print(e);
    }

    postBPCatalogueLoading.value = false;
    return result;
  }

  Future postAlternativeItem() async {
    postAlternativeItemLoading.value = true;
    PostResponseType result =
        PostResponseType(postResponseEnum: PostResponseEnum.error);

    try {
      OriginalItemModel originalItemModel =
          OriginalItemModel(AlternativeItems: [
        AlternativeItemModel(
            AlternativeItemCode: "I100589",
            MatchFactor: 100,
            Remarks: "RavaliTest")
      ], ItemCode: itemcode.value, ItemName: "2-Ethyl Hexanol_TEST");

      var res = await itemDataSourceImpl.postAlternativeItem(originalItemModel);

      res.fold((failure) {
        print(failure.message);
      }, (r) {
        print("Success");
        alternative_status.value = r;
        print(r);
        result = PostResponseType(postResponseEnum: PostResponseEnum.success);
      });
    } catch (e) {
      print(e);
    }

    postAlternativeItemLoading.value = false;
    return result;
  }

  Future sendEmail({
    required String subject,
    required String message,
    required String cvi,
    required String reqestOrApproval,
    required String cardCode,
    required String cardName,
    required String groupName,
    required String db,
    required String requestedBy,
  }) async {
    final serviceId = 'service_a3rntkf';
    final templateId = 'template_qwgcwr7';
    final useId = '0Krm41mNV9xIYO2y_';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': useId,
          'template_params': {
            'sender_email': 'nihal.vish29@gmail.com',
            'user_subject': subject,
            'user_message': message,
            'cvi': cvi,
            'RequestOrApprove': reqestOrApproval,
            'code': cardCode,
            'name': cardName,
            'group': groupName,
            'db': db,
            'by': requestedBy,
          }
        }));
    print("--------------------------------${response.body}");
  }
}
