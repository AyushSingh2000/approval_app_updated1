import 'package:get/get.dart';

import '../data/modal/get_card_detail_model.dart';
import '../data/rejected_data_source_impl.dart';
import '../data/modal/get_item_rejected_modal.dart';

class RejectedItemController extends GetxController {
  RejectedItemDataSourceImpl rejectedItemDataSourceImpl =
      RejectedItemDataSourceImpl();

  var GetRejectedStatusList = <GetItemRejectedModal>[].obs;
  RxList<GetItemRejectedModal> filteredData = <GetItemRejectedModal>[].obs;
  var GetItemDetailsList = <ItemDetail>[].obs;
  var selectDb = 'TESTAC0718'.obs;
  var itemCode = ''.obs;

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
    await getRejectedItemData();
    filteredData.assignAll(GetRejectedStatusList);
    initialDataLoading.value = false;
  }

  void filterData(String query) {
    filteredData.clear();

    if (query.isEmpty) {
      filteredData.assignAll(GetRejectedStatusList);
    } else {
      for (var item in GetRejectedStatusList) {
        if (itemMatchesQuery(item, query)) {
          filteredData.add(item);
        }
      }
    }
  }

  bool itemMatchesQuery(GetItemRejectedModal item, String query) {
    for (var i = 0; i < item.itemmasterDetails.length; i++) {
      var details = item.itemmasterDetails[i];
      if (details.ItemCode != null &&
          details.ItemCode!.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      if (details.ItemName != null &&
          details.ItemName!.toLowerCase().contains(query.toLowerCase())) {
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

  Future<void> getRejectedItemData() async {
    final data = await rejectedItemDataSourceImpl
        .getItemRejectedData(selectDb.toString());
    // print('//|||||||||||||||||||${data}');
    final List<GetItemRejectedModal> approvalStatusList = data
        .map((item) => GetItemRejectedModal(itemmasterDetails: [item]))
        .toList();
    // print(approvalStatusList);
    GetRejectedStatusList.assignAll(approvalStatusList);
    // print('From controller ${GetRejectedStatusList}');
  }

  Future<void> getItemDetailsData() async {
    detailsDataLoading.value = true;
    final data =
        await rejectedItemDataSourceImpl.getItemDetailData(itemCode.value);
    GetItemDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateItemDetailsData(String cardCode, String status) async {
    final data = await rejectedItemDataSourceImpl.updateItemStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
