import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../data/unapproved_data_source_impl.dart';
import '../data/modal/get_bp_details_modal.dart';
import '../data/modal/get_customer_un_approved_modal.dart';

class UnApprovedBpController extends GetxController {
  UnApprovedBpDataSourceImpl approvedBPDataSourceImpl =
      UnApprovedBpDataSourceImpl();

  var GetBPUN_ApprovalStatusList = <GetCustomerUnApprovedModal>[].obs;
  RxList<GetCustomerUnApprovedModal> filteredData_unApproved =
      <GetCustomerUnApprovedModal>[].obs;
  var GetBPDetailsList = <CardDetail>[].obs;
  var selectDb = 'TESTAC0718'.obs;
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
    await getUn_ApprovedCustomerData();
    filteredData_unApproved.assignAll(GetBPUN_ApprovalStatusList);
    // await getBPDetailsData();
    initialDataLoading.value = false;
  }

  void filterData_UN(String query) {
    filteredData_unApproved.clear();

    if (query.isEmpty) {
      filteredData_unApproved.assignAll(GetBPUN_ApprovalStatusList);
    } else {
      for (var item in GetBPUN_ApprovalStatusList) {
        if (itemMatchesQuery_UnApproved(item, query)) {
          filteredData_unApproved.add(item);
        }
      }
    }
  }

  bool itemMatchesQuery_UnApproved(
      GetCustomerUnApprovedModal item, String query) {
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

  Future<void> getUn_ApprovedCustomerData() async {
    final data = await approvedBPDataSourceImpl
        .getCustomerUN_ApprovedData(selectDb.value);
    print('//|||||||||||||||||||${data}');
    final List<GetCustomerUnApprovedModal> un_approvalStatusList = data
        .map((item) => GetCustomerUnApprovedModal(bpmasterDetails: [item]))
        .toList();

    GetBPUN_ApprovalStatusList.assignAll(un_approvalStatusList);
  }

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
}
