import 'package:get/get.dart';
import 'package:new_app/core/post_enum_response.dart';
// import 'package:new_app/core/utils/extensions/string_extension.dart';

import '../data/datasource/customer_data_source_impl.dart';
import '../../approved_bp/data/modal/get_bp_approval_status_modal.dart';
import '../data/model/BP_post_1.dart';

class CustomerController extends GetxController {
  CustomerDataSourceImpl customerDataSourceImpl = CustomerDataSourceImpl();

  var BPSeriesMapData = {}.obs;
  var BPSeriesList = <String>[].obs;

  var BPGroupCodeMapData = {}.obs;
  var BPGroupCodeList = <String>[].obs;

  var BPCurrenciesMapData = {}.obs;
  var BPCurrenciesList = <String>[].obs;

  var BPSaleEmployeesMapData = {}.obs;
  var BPSaleEmployeesList = <String>[].obs;

  var BPCountriesMapData = {}.obs;
  var BPCountriesList = <String>[].obs;

  var BPStatesMapData = {}.obs;
  var BPStatesList = <String>[].obs;

  var GetBPApprovalStatusList = <GetBpApprovalStatusModal>[].obs;

//all fields data
  var Series = ''.obs;
  var Code = ''.obs;
  var Name = ''.obs;
  var Cardtype = ''.obs;
  var Foreign_name = ''.obs;
  var Group = ''.obs;
  var GroupCode = 0.obs;
  var Currencies = '##'.obs;
  var Federal_tax_id = ''.obs;
  var SaleEmployees = ''.obs;
  var SaleEmployeesCode = 0.obs;
  var Telephone = ''.obs;
  var Mobile = ''.obs;
  var Email = ''.obs;
  var Website = ''.obs;
  var Arabic_address = ''.obs;
  var Status = ''.obs;
  var Active = ''.obs;
  var BpCountries = ''.obs;
  var blank = ''.obs;

  var count = '0'.obs;

//contact variable
  RxList<contactEmployees> contactemployee = <contactEmployees>[].obs;
  RxList<bPAddresses> addresslist = <bPAddresses>[].obs;

//address Bill to variables
  var Adrs_Address_Type = 'bo_BillTo'.obs;
  var Adrs_Building_Floor_Room = ''.obs;
  var Adrs_Block = ''.obs;
  var Adrs_Street = ''.obs;
  var Adrs_City = ''.obs;
  var Adrs_Country = ''.obs;
  var Adrs_State = ''.obs;
  var Adrs_Zip_Code = ''.obs;
  var Adrs_Ship_To_County = ''.obs;
  var Adrs_AddressID = ''.obs;

//address ship to
  var Adrs_s2_Address_Type = 'bo_ShipTo'.obs;
  var Adrs_s2_Building_Floor_Room = ''.obs;
  var Adrs_s2_Block = ''.obs;
  var Adrs_s2_Street = ''.obs;
  var Adrs_s2_City = ''.obs;
  var Adrs_s2_Country = ''.obs;
  var Adrs_s2_State = ''.obs;
  var Adrs_s2_Zip_Code = ''.obs;
  var Adrs_s2_Ship_To_County = ''.obs;
  var Adrs_s2_AddressID = ''.obs;

  var BpStates = ''.obs;

  var initialDataLoading = false.obs;
  var postCustomerDataLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    initialDataLoading.value = true;
    await getBPSeries();
    await getBPGroupCode();
    await getBPCurrencies();
    await getBPSaleEmployees();
    await getBPCountries();
    await getBPStates();
    // await getApprovalStatusData();
    initialDataLoading.value = false;
  }

  // Future<void> getApprovalStatusData() async {
  //   final data = await customerDataSourceImpl.getApprovalStatusData();
  //   print('//|||||||||||||||||||${data}');
  //   final List<GetBpApprovalStatusModal> approvalStatusList = data
  //       .map((item) => GetBpApprovalStatusModal(bpmasterDetails: [item]))
  //       .toList();
  //
  //   // Assign the approvalStatusList to GetBPApprovalStatusList
  //   GetBPApprovalStatusList.assignAll(approvalStatusList);
  //   // print(GetBPApprovalStatusList[0].bpmasterDetails[0].CardCode);
  // }

  Future<void> getBPSeries() async {
    final data = await customerDataSourceImpl.getBPSeries();
    BPSeriesMapData.value = data;
    BPSeriesList.value = data.keys.toList();
    // print(data);
    // print(BPSeriesList);
  }

  Future<void> getBPGroupCode() async {
    final data = await customerDataSourceImpl.getBPGroupCode();
    BPGroupCodeMapData.value = data;
    BPGroupCodeList.value = data.keys.toList();

    // print('qwertyuio${BPGroupCodeMapData}');
    // print(BPGroupCodeList);
    print(contactemployee);
  }

  Future<void> getBPCurrencies() async {
    final data = await customerDataSourceImpl.getBPCurrencies();
    BPCurrenciesMapData.value = data;
    BPCurrenciesList.value = data.keys.toList();

    // print(data);
    // print(BPCurrenciesList);
  }

  Future<void> getBPSaleEmployees() async {
    final data = await customerDataSourceImpl.getBPSaleEmployees();
    BPSaleEmployeesMapData.value = data;
    BPSaleEmployeesList.value = data.keys.toList();

    // print(data);
    // print(BPSaleEmployeesList);
  }

  Future<void> getBPCountries() async {
    final data = await customerDataSourceImpl.getBPCountries();
    BPCountriesMapData.value = data;
    BPCountriesList.value = data.keys.toList();

    print(data);
    // print(BPCountriesList);
  }

  Future<void> getBPStates() async {
    final data = await customerDataSourceImpl.getBPStates();
    BPStatesMapData.value = data;
    BPStatesList.value = data.keys.toList();

    // print(data);
    // print(BPStatesList);
  }

  Future<PostResponseType> postCustomerData() async {
    postCustomerDataLoading.value = true;
    PostResponseType result =
        PostResponseType(postResponseEnum: PostResponseEnum.error);

    try {
      print(List<bPAddresses>.from(addresslist).runtimeType);
      print(
        addresslist.toList().runtimeType,
      );
      BP_PostModel_test bp_postModel = BP_PostModel_test(
        Series: double.parse(Series.value),
        CardName: Name.value,
        CardType: Cardtype.value,
        CardForeignName: Foreign_name.value,
        GroupCode: double.parse(GroupCode.value.toString()),
        Currency: Currencies.value,
        FederalTaxID: Federal_tax_id.value,
        SalesPersonCode: SaleEmployeesCode.value.toString(),
        Phone1: Telephone.value,
        Cellular: Telephone.value,
        EmailAddress: Email.value,
        Website: Website.value,
        U_ARADDR: Arabic_address.value,
        U_TRPAPPST: "Un-Approved",
        U_TRPCRBY: "Ravali",
        BPAddresses: addresslist,
        ContactEmployees: contactemployee,
      );

      // BP_PostModel_test bp_postModel = BP_PostModel_test(
      //   Series: "75",
      //   CardName: "ABC CHEMICAL EXPORTS PVT LTD",
      //   CardType: "cCustomer",
      //   CardForeignName: "Testing",
      //   GroupCode: "103",
      //   Currency: "##",
      //   FederalTaxID: "100338468000003",
      //   SalesPersonCode: "44",
      //   Phone1: "",
      //   Cellular: "",
      //   EmailAddress: "",
      //   Website: "",
      //   U_ARADDR: "",
      //   U_TRPAPPST: "Un-Approved",
      //   U_TRPCRBY: "Ravali",
      //   BPAddresses: addresslist,
      //   ContactEmployees: contactemployee,
      // );
      print(bp_postModel.toJson());
      // String jsonRepresentation = json.encode(bp_postModel.toJson());

      var res = await customerDataSourceImpl.postBP_master(bp_postModel);

      res.fold((failure) {
        print('Error: ${failure.message}');
      }, (r) {
        result = r;
      });
    } catch (e) {
      print(e);
    }

    postCustomerDataLoading.value = false;
    return result;
  }
}
