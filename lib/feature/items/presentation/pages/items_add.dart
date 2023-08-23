import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/items/controller/items_controller.dart';
import 'package:new_app/feature/items/presentation/pages/items_add2.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';

import '../../../../ui/TextField/customTextField.dart';

class ItemsAddPage extends StatefulWidget {
  const ItemsAddPage({super.key});

  @override
  State<ItemsAddPage> createState() => _ItemsAddPageState();
}

class _ItemsAddPageState extends State<ItemsAddPage> {
  ItemsController itemsController = Get.put(ItemsController());

  // bool firstcheckboxValue = false;
  // bool secondCheckboxValue = false;
  // bool thirdCheckboxValue = false;

  InputDecoration buildTextFieldDecoration(String labelText,
      {bool hasDropdown = false}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(9),
      ),
      labelText: labelText,
      contentPadding: const EdgeInsets.only(left: 12),
      suffixIcon: hasDropdown
          ? const Icon(Icons.arrow_drop_down, color: Colors.black)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (itemsController.initialDataLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'Item Series',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 225, 225, 225),
                      labelText: 'Item series',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (newValue) {
                      itemsController.Item_Series.value = itemsController
                          .itemSeriesMapData[newValue]
                          .toString();
                    },
                    items: itemsController.itemSeriesList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'Select Group',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 225, 225, 225),
                      labelText: 'Item Group *',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (newValue) {
                      itemsController.Item_Group_Code.value =
                          itemsController.itemGroupMapData[newValue];
                    },
                    items: itemsController.itemGroupList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'select UoM',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 225, 225, 225),
                      labelText: 'UOM *',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (newValue) {
                      itemsController.UoM_code.value =
                          itemsController.UoMMapData[newValue!];
                    },
                    items: itemsController.UoMList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'Select items',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 225, 225, 225),
                      labelText: 'Purchasing UoM',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (newValue) {
                      itemsController.Purchasing_UoM.value = itemsController
                          .PurchasingUoMMapData[newValue!]
                          .toString();
                    },
                    items:
                        itemsController.PurchasingUoMList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'select items',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 225, 225, 225),
                      labelText: 'Sales UoM',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (newValue) {
                      itemsController.Sales_UoM.value =
                          itemsController.SalesUoMMapData[newValue!].toString();
                    },
                    items: itemsController.SalesUoMList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'select items',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 225, 225, 225),
                      labelText: 'Inventory UoM',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (newValue) {
                      itemsController.Inventory_UoM.value = itemsController
                          .InventoryUoMMapData[newValue!]
                          .toString();
                    },
                    items: itemsController.InventoryUoMList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                  CustomTextField(
                      hintText: 'Manage Item by',
                      onChanged: (Value) {
                        itemsController.Manage_Item_by.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Management Method',
                      onChanged: (Value) {
                        itemsController.Management_Method.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Valuation Method',
                      onChanged: (Value) {
                        itemsController.Valuation_Method.value = Value;
                      }),
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
                  CustomTextField(
                      hintText: 'Procurement Method',
                      onChanged: (Value) {
                        itemsController.Procurement_Method.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'DG Type',
                      onChanged: (Value) {
                        itemsController.DG_Type.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Status',
                      onChanged: (Value) {
                        itemsController.Status.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Min. Inventory',
                      keyboardType: TextInputType.number,
                      onChanged: (Value) {
                        itemsController.Min_Inventory.value = Value;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hintText: 'Max. Inventory',
                      keyboardType: TextInputType.number,
                      onChanged: (Value) {
                        itemsController.Max_Inventory.value = Value;
                      }),
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
                            // {
                            //   const snackBar = SnackBar(
                            //     content: Text(
                            //       'Fill all required field',
                            //       style: TextStyle(
                            //           color: Colors.blue, fontSize: 16),
                            //     ),
                            //     duration: Duration(milliseconds: 1000),
                            //     backgroundColor:
                            //         Color.fromARGB(255, 220, 220, 220),
                            //   );
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(snackBar);
                            // }
                          }
                        },
                        title: 'Next',
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
