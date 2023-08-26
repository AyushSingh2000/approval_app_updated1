import 'package:get/get.dart';

import '../../../customer/approved_bp/data/modal/get_bp_details_modal.dart';
import '../data/blank_data_source_impl.dart';
import '../data/modal/get_supplier_blank_modal.dart';

class BlankCustomerController extends GetxController {
  BlankBpDataSourceImpl blankBpDataSourceImpl = BlankBpDataSourceImpl();

  var GetBlankStatusList = <GetCustomerBlankModal>[].obs;
  RxList<GetCustomerBlankModal> filteredData = <GetCustomerBlankModal>[].obs;
  var GetBPDetailsList = <CardDetail>[].obs;

  var cardCode = ''.obs;

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
    await getBlankCustomerData();
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

  bool itemMatchesQuery_Approved(GetCustomerBlankModal item, String query) {
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

  Future<void> getBlankCustomerData() async {
    final data = await blankBpDataSourceImpl.getCustomerBlankData();
    print('//|||||||||||||||||||${data}');
    final List<GetCustomerBlankModal> approvalStatusList = data
        .map((item) => GetCustomerBlankModal(bpmasterDetails: [item]))
        .toList();

    GetBlankStatusList.assignAll(approvalStatusList);
  }

  Future<void> getBPDetailsData() async {
    detailsDataLoading.value = true;
    final data = await blankBpDataSourceImpl.getBPDetailData(cardCode.value);
    // GetBPDetailsList.assignAll(data);
    // print(GetBPDetailsList[0].CardCode);
    detailsDataLoading.value = false;
  }

  Future<void> updateBPDetailsData(String cardCode, String status) async {
    final data = await blankBpDataSourceImpl.updateBPStatusData(
        cardCode.toString(), status.toString());
    res.value = data;
  }
}
