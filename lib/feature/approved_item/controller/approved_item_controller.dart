import 'package:get/get.dart';
import '../data/approved_item_data_source_impl.dart';
import '../data/modal/get_item_approval_status_modal.dart';
import '../data/modal/get_item_master_details_modal.dart';

class ApprovedItemController extends GetxController {
  ApprovedItemDataSourceImpl approvedItemDataSourceImpl =
      ApprovedItemDataSourceImpl();

  var GetItemApprovalStatusList = <GetItemApprovalStatusModal>[].obs;
  RxList<GetItemApprovalStatusModal> filteredData =
      <GetItemApprovalStatusModal>[].obs;
  RxList<GetItemApprovalStatusModal> filteredData_unApproved =
      <GetItemApprovalStatusModal>[].obs;
  var GetItemDetailsList = <ItemDetail_code>[].obs;

  var itemCode = ''.obs;

  var initialDataLoading = false.obs;
  var detailsDataLoading = false.obs;

  var searchToggle = false.obs;

  @override
  void onInit() async {
    super.onInit();
    initialDataLoading.value = true;
    await getApprovalStatusData();
    filteredData.assignAll(GetItemApprovalStatusList);
    filteredData_unApproved.assignAll(GetItemApprovalStatusList);
    initialDataLoading.value = false;
  }

  void filterData(String query) {
    // Clear the previous filtered data
    filteredData.clear();

    // Iterate through the original data and add matching items to filteredData
    if (query.isEmpty) {
      filteredData.assignAll(GetItemApprovalStatusList);
    } else {
      for (var item in GetItemApprovalStatusList) {
        if (item.itemmasterDetails[0].ItemCode!
            .toLowerCase()
            .contains(query.toLowerCase())) {
          filteredData.add(item);
        }
      }
    }
  }

  void filterData_Un(String query) {
    // Clear the previous filtered data
    filteredData_unApproved.clear();

    // Iterate through the original data and add matching items to filteredData
    if (query.isEmpty) {
      filteredData_unApproved.assignAll(GetItemApprovalStatusList);
    } else {
      for (var item in GetItemApprovalStatusList) {
        if (item.itemmasterDetails[0].ItemCode!
            .toLowerCase()
            .contains(query.toLowerCase())) {
          filteredData_unApproved.add(item);
        }
      }
    }
  }

  Future<void> getApprovalStatusData() async {
    final data = await approvedItemDataSourceImpl.getApprovalStatusData();
    print('???????????????${data}');
    final List<GetItemApprovalStatusModal> approvalStatusList = data
        .map((item) => GetItemApprovalStatusModal(itemmasterDetails: [item]))
        .toList();

    GetItemApprovalStatusList.assignAll(approvalStatusList);
    print(GetItemApprovalStatusList[0].itemmasterDetails[0].ItemCode);
  }

  Future<void> getItemsDetailsData() async {
    detailsDataLoading.value = true;
    final data =
        await approvedItemDataSourceImpl.getItemsDetailData(itemCode.value);
    GetItemDetailsList.assignAll(data);
    detailsDataLoading.value = false;
  }
}
