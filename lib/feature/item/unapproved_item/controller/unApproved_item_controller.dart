import 'package:get/get.dart';

import '../data/modal/get_card_detail_model.dart';
import '../data/blank_data_source_impl.dart';
import '../data/modal/get_item_unApproved_modal.dart';

class UnApprovedItemController extends GetxController {
  UnApprovedItemDataSourceImpl unApprovedItemDataSourceImpl =
      UnApprovedItemDataSourceImpl();

  var GetUnApprovedStatusList = <GetItemUnApprovedModal>[].obs;
  RxList<GetItemUnApprovedModal> filteredData = <GetItemUnApprovedModal>[].obs;
  var GetItemDetailsList = <ItemDetail>[].obs;

  var itemCode = ''.obs;

  var initialDataLoading = false.obs;
  var detailsDataLoading = false.obs;

  var searchToggle = false.obs;
  var sortToggle = false.obs;

  var load = false.obs;
  var load_rejected = false.obs;
  var res = ''.obs;

  var un_dataLoading = false.obs;

  final RxString selectedValue = ''.obs;
  final RxString selectedValue_approved = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    initialDataLoading.value = true;
    await getUnApprovedItemData();
    filteredData.assignAll(GetUnApprovedStatusList);
    initialDataLoading.value = false;
  }

  void filterData(String query) {
    filteredData.clear();

    if (query.isEmpty) {
      filteredData.assignAll(GetUnApprovedStatusList);
    } else {
      for (var item in GetUnApprovedStatusList) {
        if (itemMatchesQuery_Approved(item, query)) {
          filteredData.add(item);
        }
      }
    }
  }

  bool itemMatchesQuery_Approved(GetItemUnApprovedModal item, String query) {
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

  Future<void> getUnApprovedItemData() async {
    final data = await unApprovedItemDataSourceImpl.getItemUnApprovedData();
    print('//|||||||||||||||||||${data}');
    final List<GetItemUnApprovedModal> approvalStatusList = data
        .map((item) => GetItemUnApprovedModal(itemmasterDetails: [item]))
        .toList();

    GetUnApprovedStatusList.assignAll(approvalStatusList);
  }

  Future<void> getItemDetailsData() async {
    detailsDataLoading.value = true;
    final data =
        await unApprovedItemDataSourceImpl.getItemDetailData(itemCode.value);
    GetItemDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateItemDetailsData(String cardCode, String status) async {
    final data = await unApprovedItemDataSourceImpl.updateItemStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
