import 'package:get/get.dart';

import '../data/modal/get_card_detail_model.dart';
import '../data/approved_data_source_impl.dart';
import '../data/modal/get_item_approved_modal.dart';

class ApprovedItemController extends GetxController {
  ApprovedItemDataSourceImpl approvedItemDataSourceImpl =
      ApprovedItemDataSourceImpl();

  var GetApprovedStatusList = <GetItemApprovedModal>[].obs;
  RxList<GetItemApprovedModal> filteredData = <GetItemApprovedModal>[].obs;
  var GetItemDetailsList = <ItemDetail>[].obs;

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
    await getApprovedItemData();
    filteredData.assignAll(GetApprovedStatusList);
    initialDataLoading.value = false;
  }

  void filterData(String query) {
    filteredData.clear();

    if (query.isEmpty) {
      filteredData.assignAll(GetApprovedStatusList);
    } else {
      for (var item in GetApprovedStatusList) {
        if (itemMatchesQuery_Approved(item, query)) {
          filteredData.add(item);
        }
      }
    }
  }

  bool itemMatchesQuery_Approved(GetItemApprovedModal item, String query) {
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

  Future<void> getApprovedItemData() async {
    final data = await approvedItemDataSourceImpl.getItemApprovedData();
    print('//|||||||||||||||||||${data}');
    final List<GetItemApprovedModal> approvalStatusList = data
        .map((item) => GetItemApprovedModal(itemmasterDetails: [item]))
        .toList();

    GetApprovedStatusList.assignAll(approvalStatusList);
  }

  Future<void> getItemDetailsData() async {
    detailsDataLoading.value = true;
    final data =
        await approvedItemDataSourceImpl.getItemDetailData(itemCode.value);
    GetItemDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateItemDetailsData(String cardCode, String status) async {
    final data = await approvedItemDataSourceImpl.updateItemStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
