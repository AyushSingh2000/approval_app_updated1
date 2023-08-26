import 'package:get/get.dart';
import '../data/approved_data_source_impl.dart';
import '../data/modal/get_bp_approval_status_modal.dart';
import '../data/modal/get_bp_details_modal.dart';
import '../data/modal/get_customer_un_approved_modal.dart';

class ApprovedBpController extends GetxController {
  ApprovedBpDataSourceImpl approvedBPDataSourceImpl =
      ApprovedBpDataSourceImpl();

  var GetBPApprovalStatusList = <GetBpApprovalStatusModal>[].obs;
  // var GetBPUN_ApprovalStatusList = <GetCustomerUnApprovedModal>[].obs;
  RxList<GetBpApprovalStatusModal> filteredData =
      <GetBpApprovalStatusModal>[].obs;
  // RxList<GetCustomerUnApprovedModal> filteredData_unApproved =
  //     <GetCustomerUnApprovedModal>[].obs;
  var GetBPDetailsList = <CardDetail>[].obs;

  var cardCode = ''.obs;

  var initialDataLoading = false.obs;
  var detailsDataLoading = false.obs;

  var searchToggle = false.obs;
  var sortToggle = false.obs;

  var load = false.obs;
  var load_rejected = false.obs;
  var res = ''.obs;

  var rejectedLoading = false.obs;

  final RxString selectedValue = ''.obs;
  final RxString selectedValue_approved = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    initialDataLoading.value = true;
    await getApprovedCustomerData();
    // await getUn_ApprovedCustomerData();
    filteredData.assignAll(GetBPApprovalStatusList);
    // filteredData_unApproved.assignAll(GetBPUN_ApprovalStatusList);
    // await getBPDetailsData();
    initialDataLoading.value = false;
  }

  void filterData(String query) {
    filteredData.clear();

    if (query.isEmpty) {
      filteredData.assignAll(GetBPApprovalStatusList);
    } else {
      for (var item in GetBPApprovalStatusList) {
        if (itemMatchesQuery_Approved(item, query)) {
          filteredData.add(item);
        }
      }
    }
  }

  bool itemMatchesQuery_Approved(GetBpApprovalStatusModal item, String query) {
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

  // void filterData_UN(String query) {
  //   filteredData_unApproved.clear();
  //
  //   if (query.isEmpty) {
  //     filteredData_unApproved.assignAll(GetBPUN_ApprovalStatusList);
  //   } else {
  //     for (var item in GetBPUN_ApprovalStatusList) {
  //       if (itemMatchesQuery_UnApproved(item, query)) {
  //         filteredData_unApproved.add(item);
  //       }
  //     }
  //   }
  // }

  // bool itemMatchesQuery_UnApproved(
  //     GetCustomerUnApprovedModal item, String query) {
  //   for (var i = 0; i < item.bpmasterDetails.length; i++) {
  //     var details = item.bpmasterDetails[i];
  //     if (details.CardCode != null &&
  //         details.CardCode!.toLowerCase().contains(query.toLowerCase())) {
  //       return true;
  //     }
  //     if (details.CardName != null &&
  //         details.CardName!.toLowerCase().contains(query.toLowerCase())) {
  //       return true;
  //     }
  //     if (details.GroupName != null &&
  //         details.GroupName!.toLowerCase().contains(query.toLowerCase())) {
  //       return true;
  //     }
  //     if (details.RequestedBy != null &&
  //         details.RequestedBy.toLowerCase().contains(query.toLowerCase())) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  Future<void> getApprovedCustomerData() async {
    final data = await approvedBPDataSourceImpl.getCustomerApprovedData2();
    print('//|||||||||||||||||||${data}');
    final List<GetBpApprovalStatusModal> approvalStatusList = data
        .map((item) => GetBpApprovalStatusModal(bpmasterDetails: [item]))
        .toList();

    GetBPApprovalStatusList.assignAll(approvalStatusList);
  }

  // Future<void> getUn_ApprovedCustomerData() async {
  //   final data = await approvedBPDataSourceImpl.getCustomerUN_ApprovedData();
  //   print('//|||||||||||||||||||${data}');
  //   final List<GetCustomerUnApprovedModal> un_approvalStatusList = data
  //       .map((item) => GetCustomerUnApprovedModal(bpmasterDetails: [item]))
  //       .toList();
  //
  //   GetBPUN_ApprovalStatusList.assignAll(un_approvalStatusList);
  // }

  Future<void> getBPDetailsData() async {
    detailsDataLoading.value = true;
    final data = await approvedBPDataSourceImpl.getBPDetailData(cardCode.value);
    GetBPDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateBPDetailsData(String cardCode, String status) async {
    final data = await approvedBPDataSourceImpl.updateBPStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
