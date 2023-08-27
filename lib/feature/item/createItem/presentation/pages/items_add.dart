import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';

import '../../../../../ui/TextField/customTextField.dart';
import '../../controller/items_controller.dart';
import 'items_add2.dart';

class ItemsAddPage extends StatefulWidget {
  const ItemsAddPage({super.key});

  @override
  State<ItemsAddPage> createState() => _ItemsAddPageState();
}

class _ItemsAddPageState extends State<ItemsAddPage> {
  ItemsController itemsController = Get.put(ItemsController());

  // InputDecoration buildTextFieldDecoration(String labelText,
  //     {bool hasDropdown = false}) {
  //   return InputDecoration(
  //     border: OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.black),
  //       borderRadius: BorderRadius.circular(9),
  //     ),
  //     labelText: labelText,
  //     contentPadding: const EdgeInsets.only(left: 12),
  //     suffixIcon: hasDropdown
  //         ? const Icon(Icons.arrow_drop_down, color: Colors.black)
  //         : null,
  //   );
  // }

  List<String> manageItemBy = ['Batches', 'Serial Numbers', 'None'];
  Map<String, String> manageMap = {
    'Batches': 'N',
    'Serial Numbers': 'Y  ',
    'None': '0'
  };
  List<String> manageMethod = ['On Every Transaction', 'On Release'];
  Map<String, String> manageMethodMap = {
    'On Every Transaction': 'A',
    'On Release': 'B'
  };
  List<String> ValuationMethod = [
    'FIFO',
    'Standard',
    'Moving Average',
    'Serial/Batch'
  ];

  Map<String, String> ValuationMap = {
    'FIFO': 'F',
    'Standard': 'S',
    'Moving Average': 'A',
    'Serial/Batch': 'B'
  };

  List<String> procurementMethod = [
    'Buy',
    'Make',
  ];

  Map<String, String> procurementMap = {
    'Buy': 'B',
    'Make': 'M',
  };

  List<String> dgMethod = [
    'DG',
    'Non-DG',
  ];

  Map<String, String> dgMap = {
    'DG': 'DG',
    'Non-DG': 'Non-DG',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items",
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (itemsController.initialDataLoading.value) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: itemsController.itemSeriesList.isEmpty
                            ? 'No Item series Found'
                            : 'Select Item series',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: itemsController.itemSeriesList,
                      onChanged: (dynamic newValue) {
                        itemsController.Item_Series.value = itemsController
                            .itemSeriesMapData[newValue]
                            .toString();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                      hintText: 'Item Name',
                      onChanged: (Value) {
                        itemsController.Item_Name.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Foreign Name',
                    onChanged: (po) {
                      itemsController.Foreign_Name.value = po;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: itemsController.itemGroupList.isEmpty
                            ? 'No Group Found'
                            : 'Select Group',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: itemsController.itemGroupList,
                      onChanged: (dynamic newValue) {
                        itemsController.Item_Group_Code.value =
                            itemsController.itemGroupMapData[newValue];
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text('Inventory Item'),
                    value: itemsController.Inventory_Item.value,
                    onChanged: (newValue) {
                      itemsController.Inventory_Item.value = newValue!;
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Sales Item'),
                    value: itemsController.Sales_Item.value,
                    onChanged: (newValue) {
                      itemsController.Sales_Item.value = newValue!;
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Purchase Item'),
                    value: itemsController.Purchase_Item.value,
                    onChanged: (newValue) {
                      itemsController.Purchase_Item.value = newValue!;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: itemsController.UoMList.isEmpty
                            ? 'No UOM Found'
                            : 'Select UOM',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: itemsController.UoMList,
                      onChanged: (dynamic newValue) {
                        itemsController.UoM_code.value =
                            itemsController.UoMMapData[newValue!];
                        print(itemsController.UoM_code.value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: itemsController.PurchasingUoMList.isEmpty
                            ? 'No Purchasing UOM Found'
                            : 'Select Purchasing UOM',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: itemsController.PurchasingUoMList,
                      onChanged: (dynamic newValue) {
                        itemsController.Purchasing_UoM.value = itemsController
                            .PurchasingUoMMapData[newValue!]
                            .toString();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: itemsController.SalesUoMList.isEmpty
                            ? 'No Sales UOM Found'
                            : 'Select Sales UOM',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: itemsController.SalesUoMList,
                      onChanged: (dynamic newValue) {
                        itemsController.Sales_UoM.value = itemsController
                            .SalesUoMMapData[newValue!]
                            .toString();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: itemsController.InventoryUoMList.isEmpty
                            ? 'No Inventory UOM Found'
                            : 'Select Inventory UOM',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: itemsController.InventoryUoMList,
                      onChanged: (dynamic newValue) {
                        itemsController.Inventory_UoM.value = itemsController
                            .InventoryUoMMapData[newValue!]
                            .toString();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Mfr Catalog No.',
                      onChanged: (Value) {
                        itemsController.Mfr_Catalog_No.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: 'Manage Item by',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: manageItemBy,
                      onChanged: (dynamic newValue) {
                        itemsController.Manage_Item_by.value =
                            manageMap[newValue]!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: 'Management Method',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: manageMethod,
                      onChanged: (dynamic newValue) {
                        itemsController.Management_Method.value =
                            manageMethodMap[newValue]!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: 'Valuation Method',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: ValuationMethod,
                      onChanged: (dynamic newValue) {
                        itemsController.Valuation_Method.value =
                            ValuationMap[newValue]!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Additional Identifier',
                      onChanged: (Value) {
                        itemsController.Additional_Identifier.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'HS Code',
                      onChanged: (Value) {
                        itemsController.HS_Code.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Classification No',
                      onChanged: (Value) {
                        itemsController.Classification_No.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: 'Procurement Method',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: procurementMethod,
                      onChanged: (dynamic newValue) {
                        itemsController.Procurement_Method.value =
                            procurementMap[newValue]!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: 'DG Type',
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(9)),
                        // hintText: 'Select State',
                        filled: true,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        isCollapsed: true,
                      ),
                      options: dgMethod,
                      onChanged: (dynamic newValue) {
                        itemsController.DG_Type.value = dgMap[newValue]!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // CustomTextField(
                  //     hintText: 'Status',
                  //     onChanged: (Value) {
                  //       itemsController.Status.value = Value;
                  //     }),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //     hintText: 'Min. Inventory',
                  //     keyboardType: TextInputType.number,
                  //     onChanged: (Value) {
                  //       itemsController.Min_Inventory.value = Value;
                  //     }),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //     hintText: 'Max. Inventory',
                  //     keyboardType: TextInputType.number,
                  //     onChanged: (Value) {
                  //       itemsController.Max_Inventory.value = Value;
                  //     }),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ButtonBS(
                        borderRadius: 12,
                        backgroundColor: Colors.blue,
                        height: 40,
                        width: 80,
                        textColor: Colors.white,
                        onPressed: () {
                          // Navigator.of(context).pop();
                          if ((itemsController.Item_Series.value != '' &&
                              itemsController.Item_Group_Code.value != '' &&
                              itemsController.UoM_code.value != '' &&
                              itemsController.Purchasing_UoM.value != '' &&
                              itemsController.Sales_UoM.value != '' &&
                              itemsController.Inventory_UoM.value != '')) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Items2()));
                          } else {
                            _showDialog(context);
                          }
                        },
                        title: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Adjust the value as needed
        ),
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        title: const Text('Attention'),
        content: const Text('Fill all reqired fields.'),
      );
    },
  );

  // Automatically close the dialog after 2 seconds
  Future.delayed(Duration(seconds: 1), () {
    Navigator.of(context).pop();
  });
}
