import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_app/core/post_enum_response.dart';
// import 'package:new_app/core/utils/extensions/string_extension.dart';
import 'package:http/http.dart' as http;
import '../../../customer/approved_bp/data/modal/get_bp_approval_status_modal.dart';
import '../data/datasource/supplier_data_source_impl.dart';
import '../data/model/supplier_post_1.dart';

class SupplierController extends GetxController {
  SupplierDataSourceImpl supplierDataSourceImpl = SupplierDataSourceImpl();

  var BPSeriesMapData = {}.obs;
  var BPSeriesList = <String>[].obs;

  var BPGroupCodeMapData = {}.obs;
  var BPGroupCodeList = <String>[].obs;

  var BPCurrenciesMapData = {}.obs;
  var BPCurrenciesList = <String>[].obs;

  var BPSaleEmployeesMapData = {}.obs;
  var BPSaleEmployeesList = <String>[].obs;

  ///handeling country and state relations

  var BPCountriesMapData = {}.obs;
  var BPCountriesList = <String>[].obs;

  var BPStatesMaptempData = {}.obs;
  var BPStatesMapData = {}.obs;

  var BPStatesList = <String>[].obs;
  var BPStatestempList = <String>[].obs;

  var BPStatesFullList = <dynamic>[].obs;

  var BPStateCodeMapData = {}.obs;
  var BPCountryStateNameMapData = {}.obs;

  ///------------------------------------

  var BPCountyMapData = {}.obs;
  var BPCountyList = <String>[].obs;

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

  var database = <String>[].obs;
  var dbString = ''.obs;

  var count = '0'.obs;

//contact variable
  RxList<contactEmployees_supplier> contactemployee =
      <contactEmployees_supplier>[].obs;
  RxList<bPAddresses_supplier> addresslist = <bPAddresses_supplier>[].obs;

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
    await getBPCounty();
    BPStatestempList.assignAll(BPStatesList);
    BPStatesMaptempData.assignAll(BPStatesMapData);
    // await getApprovalStatusData();
    initialDataLoading.value = false;
  }

  Future<void> createBPCountryStateMap(String country) async {
    BPStatestempList.clear();
    BPStatesMaptempData.clear();
    if (country.isEmpty) {
      BPStatestempList.assignAll(BPStatesList);
      BPStatesMaptempData.assignAll(BPStatesMapData);
    } else {
      for (var item in BPStatesFullList) {
        print(item);
        // if(item.)
        if (item["CountryNm"].toLowerCase().contains(country.toLowerCase())) {
          BPStatestempList.add(item["Name"]);
          BPStatesMaptempData[item["Name"]] = item["Code"];
        }
      }
    }
    print(BPStatesMaptempData);
  }

  Future<void> getBPSeries() async {
    final data = await supplierDataSourceImpl.getBPSeries_supplier();
    BPSeriesMapData.value = data;
    BPSeriesList.value = data.keys.toList();
    // print(data);
    // print(BPSeriesList);
  }

  Future<void> getBPGroupCode() async {
    final data = await supplierDataSourceImpl.getBPGroupCode_supplier();
    BPGroupCodeMapData.value = data;
    BPGroupCodeList.value = data.keys.toList();

    // print('qwertyuio${BPGroupCodeMapData}');
    // print(BPGroupCodeList);
    print(contactemployee);
  }

  Future<void> getBPCurrencies() async {
    final data = await supplierDataSourceImpl.getBPCurrencies_supplier();
    BPCurrenciesMapData.value = data;
    BPCurrenciesList.value = data.keys.toList();

    // print(data);
    // print(BPCurrenciesList);
  }

  Future<void> getBPSaleEmployees() async {
    final data = await supplierDataSourceImpl.getBPSaleEmployees_supplier();
    BPSaleEmployeesMapData.value = data;
    BPSaleEmployeesList.value = data.keys.toList();

    // print(data);
    // print(BPSaleEmployeesList);
  }

  Future<void> getBPCountries() async {
    final data = await supplierDataSourceImpl.getBPCountries_supplier();
    BPCountriesMapData.value = data;
    BPCountriesList.value = data.keys.toList();

    print(data);
    // print(BPCountriesList);
  }

  Future<void> getBPStates() async {
    final data = await supplierDataSourceImpl.getBPStates_supplier();
    BPStatesFullList.assignAll(data);
    print('${BPStatesFullList}');
    Map<String, String> newBPStatesMapData = {};
    BPStatesFullList.forEach((element) {
      BPStatesList.add(element["Name"]);
      newBPStatesMapData[element["Name"]] = element["Code"];
    });
    BPStatesMapData.assignAll(newBPStatesMapData);
    print(BPStatesMapData);
  }

  Future<void> getBPCounty() async {
    final data = await supplierDataSourceImpl.getBPCounty_supplier();
    BPCountyMapData.value = data;
    BPCountyList.value = data.keys.toList();

    // print(BPCountyMapData.value);
    print(BPCountyList.value);
  }

  Future<PostResponseType> postCustomerData() async {
    postCustomerDataLoading.value = true;
    PostResponseType result =
        PostResponseType(postResponseEnum: PostResponseEnum.error);

    try {
      print(List<bPAddresses_supplier>.from(addresslist).runtimeType);
      print(
        addresslist.toList().runtimeType,
      );
      BP_PostModel_Supplier bp_postModel = BP_PostModel_Supplier(
        Series: double.parse(Series.value),
        CardName: Name.value,
        CardType: 'S',
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
        U_TRPBPTYP: "",
        U_TRPAPPST: "Un-Approved",
        U_TRPCRBY: "Ravali",
        U_TRPADBS: dbString.value,
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

      var res =
          await supplierDataSourceImpl.postBP_master_supplier(bp_postModel);

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

  Future sendEmail({
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
}
