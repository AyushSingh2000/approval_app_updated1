import 'package:get/get.dart';

import '../data/modal/get_card_detail_model.dart';
import '../data/blank_data_source_impl.dart';
import '../data/modal/get_supplier_blank_modal.dart';

class BlankSupplierController extends GetxController {
  BlankSupplierDataSourceImpl blankSupplierDataSourceImpl =
      BlankSupplierDataSourceImpl();

  var GetBlankStatusList = <GetSupplierBlankModal>[].obs;
  RxList<GetSupplierBlankModal> filteredData = <GetSupplierBlankModal>[].obs;
  var GetSupplierDetailsList = <CardDetail>[].obs;

  var cardCode = ''.obs;

  var initialDataLoading = false.obs;
  var detailsDataLoading = false.obs;

  var searchToggle = false.obs;
  var sortToggle = false.obs;

  var load1 = false.obs;
  var load2 = false.obs;
  var res = ''.obs;

  var un_dataLoading = false.obs;

  final RxString selectedValue = ''.obs;
  final RxString selectedValue_approved = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    initialDataLoading.value = true;
    await getBlankSupplierData();
    filteredData.assignAll(GetBlankStatusList);
    initialDataLoading.value = false;
  }

  void filterData(String query) {
    filteredData.clear();

    if (query.isEmpty) {
      filteredData.assignAll(GetBlankStatusList);
    } else {
      for (var item in GetBlankStatusList) {
        if (itemMatchesQuery_Approved(item, query)) {
          filteredData.add(item);
        }
      }
    }
  }

  bool itemMatchesQuery_Approved(GetSupplierBlankModal item, String query) {
    for (var i = 0; i < item.bpmasterDetails.length; i++) {
      var details = item.bpmasterDetails[i];
      if (details.CardCode != null &&
          details.CardCode!.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      if (details.CardName != null &&
          details.CardName!.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      if (details.GroupName != null &&
          details.GroupName!.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      if (details.RequestedBy != null &&
          details.RequestedBy.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  Future<void> getBlankSupplierData() async {
    final data = await blankSupplierDataSourceImpl.getSupplierBlankData();
    print('//|||||||||||||||||||${data}');
    final List<GetSupplierBlankModal> approvalStatusList = data
        .map((item) => GetSupplierBlankModal(bpmasterDetails: [item]))
        .toList();

    GetBlankStatusList.assignAll(approvalStatusList);
  }

  Future<void> getSupplierDetailsData() async {
    detailsDataLoading.value = true;
    final data =
        await blankSupplierDataSourceImpl.getSupplierDetailData(cardCode.value);
    GetSupplierDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateSupplierDetailsData(String cardCode, String status) async {
    final data = await blankSupplierDataSourceImpl.updateSupplierStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
