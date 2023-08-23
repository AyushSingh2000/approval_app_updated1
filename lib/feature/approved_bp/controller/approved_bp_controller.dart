import 'package:get/get.dart';
import '../data/approved_data_source_impl.dart';
import '../data/modal/get_bp_approval_status_modal.dart';
import '../data/modal/get_bp_details_modal.dart';

class ApprovedBpController extends GetxController {
  ApprovedBpDataSourceImpl approvedBPDataSourceImpl =
      ApprovedBpDataSourceImpl();

  var GetBPApprovalStatusList = <GetBpApprovalStatusModal>[].obs;
  RxList<GetBpApprovalStatusModal> filteredData =
      <GetBpApprovalStatusModal>[].obs;
  RxList<GetBpApprovalStatusModal> filteredData_unApproved =
      <GetBpApprovalStatusModal>[].obs;
  var GetBPDetailsList = <CardDetail>[].obs;

  var cardCode = ''.obs;

  var initialDataLoading = false.obs;
  var detailsDataLoading = false.obs;

  var searchToggle = false.obs;

  @override
  void onInit() async {
    super.onInit();

    initialDataLoading.value = true;
    await getApprovalStatusData();
    filteredData.assignAll(GetBPApprovalStatusList);
    filteredData_unApproved.assignAll(GetBPApprovalStatusList);
    // await getBPDetailsData();
    initialDataLoading.value = false;
  }

  // Function to filter data based on the search query
  void filterData(String query) {
    // Clear the previous filtered data
    filteredData.clear();

    // Iterate through the original data and add matching items to filteredData
    if (query.isEmpty) {
      filteredData.assignAll(GetBPApprovalStatusList);
    } else {
      for (var item in GetBPApprovalStatusList) {
        if (item.bpmasterDetails[0].CardName!
            .toLowerCase()
            .contains(query.toLowerCase())) {
          filteredData.add(item);
        }
      }
    }
  }

  void filterData_UN(String query) {
    // Clear the previous filtered data
    filteredData_unApproved.clear();

    // Iterate through the original data and add matching items to filteredData
    if (query.isEmpty) {
      filteredData_unApproved.assignAll(GetBPApprovalStatusList);
    } else {
      for (var item in GetBPApprovalStatusList) {
        if (item.bpmasterDetails[0].CardName!
            .toLowerCase()
            .contains(query.toLowerCase())) {
          filteredData_unApproved.add(item);
        }
      }
    }
  }

  Future<void> getApprovalStatusData() async {
    final data = await approvedBPDataSourceImpl.getApprovalStatusData();
    print('//|||||||||||||||||||${data}');
    final List<GetBpApprovalStatusModal> approvalStatusList = data
        .map((item) => GetBpApprovalStatusModal(bpmasterDetails: [item]))
        .toList();

    GetBPApprovalStatusList.assignAll(approvalStatusList);
    // print(GetBPApprovalStatusList[0].bpmasterDetails[0].CardCode);
  }

  Future<void> getBPDetailsData() async {
    detailsDataLoading.value = true;
    final data = await approvedBPDataSourceImpl.getBPDetailData(cardCode.value);
    GetBPDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }
}
