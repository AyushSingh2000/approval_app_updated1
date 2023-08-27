import 'package:get/get.dart';

import '../data/modal/get_card_detail_model.dart';
import '../data/blank_data_source_impl.dart';
import '../data/modal/get_item_blank_modal.dart';

class BlankItemController extends GetxController {
  BlankItemDataSourceImpl blankItemDataSourceImpl = BlankItemDataSourceImpl();

  var GetBlankStatusList = <GetItemBlankModal>[].obs;
  RxList<GetItemBlankModal> filteredData = <GetItemBlankModal>[].obs;
  var GetItemDetailsList = <ItemDetail_blank>[].obs;

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
    await getBlankItemData();
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

  bool itemMatchesQuery_Approved(GetItemBlankModal item, String query) {
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

  Future<void> getBlankItemData() async {
    final data = await blankItemDataSourceImpl.getItemBlankData();
    print('//|||||||||||||||||||${data}');
    final List<GetItemBlankModal> approvalStatusList = data
        .map((item) => GetItemBlankModal(itemmasterDetails: [item]))
        .toList();

    GetBlankStatusList.assignAll(approvalStatusList);
  }

  Future<void> getItemDetailsData() async {
    detailsDataLoading.value = true;
    final data =
        await blankItemDataSourceImpl.getItemDetailData(cardCode.value);
    GetItemDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateItemDetailsData(String cardCode, String status) async {
    final data = await blankItemDataSourceImpl.updateSupplierStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
