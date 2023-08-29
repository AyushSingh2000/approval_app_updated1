import 'dart:convert';
import 'package:http/http.dart' as http;
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
  var selectDb = 'TESTAC0718'.obs;
  var itemCode = ''.obs;
  var remarks = ''.obs;
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
    final data = await unApprovedItemDataSourceImpl
        .getItemUnApprovedData(selectDb.toString());
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

  Future sendEmail(
      {required String subject,
      required String message,
      required String cvi,
      required String reqestOrApproval,
      required String cardCode,
      required String cardName,
      required String groupName,
      required String db,
      required String requestedBy}) async {
    final serviceId = 'service_a3rntkf';
    final templateId = 'template_qwgcwr7';
    final useId = '0Krm41mNV9xIYO2y_';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': useId,
          'template_params': {
            'sender_email': 'nihal.vish29@gmail.com',
            'user_subject': subject,
            'user_message': message,
            'cvi': cvi,
            'RequestOrApprove': reqestOrApproval,
            'code': cardCode,
            'name': cardName,
            'group': groupName,
            'db': db,
            'by': requestedBy
          }
        }));
    print("--------------------------------${response.body}");
  }

  Future sendEmail_Rejected({
    required String subject,
    required String message,
    required String cvi,
    required String reqestOrApproval,
    required String cardCode,
    required String cardName,
    required String groupName,
    required String db,
    required String requestedBy,
  }) async {
    final serviceId = 'service_a3rntkf';
    final templateId = 'template_jc47wxo';
    final useId = '0Krm41mNV9xIYO2y_';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': useId,
          'template_params': {
            'sender_email': 'nihal.vish29@gmail.com',
            'user_subject': subject,
            'user_message': message,
            'cvi': cvi,
            'RequestOrApprove': reqestOrApproval,
            'code': cardCode,
            'name': cardName,
            'group': groupName,
            'db': db,
            'by': requestedBy,
            'remarks': remarks.value.toString(),
          }
        }));
    print("--------------------------------${response.body}");
  }
}
