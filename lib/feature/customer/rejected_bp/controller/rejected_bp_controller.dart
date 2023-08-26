import 'package:get/get.dart';

import '../../approved_bp/data/modal/get_bp_details_modal.dart';
import '../data/rejected_data_source_impl.dart';
import '../data/modal/get_customer_rejected_modal.dart';

class RejectedCustomerController extends GetxController {
  RejectedBpDataSourceImpl rejectedBpDataSourceImpl =
      RejectedBpDataSourceImpl();

  var GetRejectedStatusList = <GetCustomerRejectedModal>[].obs;
  RxList<GetCustomerRejectedModal> filteredData =
      <GetCustomerRejectedModal>[].obs;
  var GetBPDetailsList = <CardDetail>[].obs;

  var cardCode = ''.obs;

  var initialDataLoading = false.obs;
  var detailsDataLoading = false.obs;

  var searchToggle = false.obs;
  var sortToggle = false.obs;

  var load = false.obs;
  var load2 = false.obs;
  var res = ''.obs;

  var un_dataLoading = false.obs;

  final RxString selectedValue = ''.obs;
  final RxString selectedValue_approved = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    initialDataLoading.value = true;
    await getRejectedCustomerData();
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

  bool itemMatchesQuery(GetCustomerRejectedModal item, String query) {
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

  Future<void> getRejectedCustomerData() async {
    final data = await rejectedBpDataSourceImpl.getCustomerRejectedData();
    print('//|||||||||||||||||||${data}');
    final List<GetCustomerRejectedModal> approvalStatusList = data
        .map((item) => GetCustomerRejectedModal(bpmasterDetails: [item]))
        .toList();

    GetRejectedStatusList.assignAll(approvalStatusList);
  }

  Future<void> getBPDetailsData() async {
    detailsDataLoading.value = true;
    final data = await rejectedBpDataSourceImpl.getBPDetailData(cardCode.value);
    GetBPDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateBPDetailsData(String cardCode, String status) async {
    final data = await rejectedBpDataSourceImpl.updateBPStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
