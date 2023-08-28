// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../pages/items_add4.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/TextField/customTextField.dart';

import '../../controller/items_controller.dart';

class Items3 extends StatefulWidget {
  const Items3({super.key});

  @override
  State<Items3> createState() => _Items3State();
}

class _Items3State extends State<Items3> {
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

  List<String> catalog = ['Yes', 'No'];
  Map<String, String> catalogMap = {'Yes': 'Y', 'No': 'N'};

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ItemsController());
    ItemsController itemsController = Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("BP Catalog Numbers"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () {
                final BPdataList = Get.find<ItemsController>()
                    .BPdataList
                    .map((element) => element.toString())
                    .toList();
                // return DropdownButtonFormField<String>(
                //   isExpanded: true,
                //   hint: const Text(
                //     'select items',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   decoration: InputDecoration(
                //     filled: true, //<-- SEE HERE

                //     fillColor: const Color.fromARGB(255, 225, 225, 225),
                //     labelText: 'BP Name',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12)),
                //   ),
                //   onChanged: (newValue) {
                //     itemsController.BP_Name.value = newValue!;
                //     itemsController.BP_Code.value = newValue;
                //   },
                //   items: BPdataList.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // );
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: TextDropdownFormField(
                    decoration: InputDecoration(
                      // enabled: false,
                      labelText: BPdataList.isEmpty
                          ? 'No Items Found'
                          : 'Select Items',
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
                    options: BPdataList,
                    onChanged: (dynamic newValue) {
                      itemsController.BP_Name.value = newValue!;
                      itemsController.BP_Code.value = newValue;
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => CustomTextField(
                hintText: itemsController
                            .BPdataMapData[itemsController.BP_Name.value] ==
                        null
                    ? 'BP Code'
                    : itemsController
                        .BPdataMapData[itemsController.BP_Name.value]
                        .toString(),
                keyboardType: TextInputType.none,
                enable: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0),
              height: 60,
              child: TextDropdownFormField(
                decoration: InputDecoration(
                  // enabled: false,
                  labelText: 'BP Catalog No',
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
                options: catalog,
                onChanged: (dynamic newValue) {
                  itemsController.BP_Catalog_No.value = catalogMap[newValue]!;
                },
              ),
            ),
            // CustomTextField(
            //     hintText: 'BP Catalog No',
            //     onChanged: (Value) {
            //       itemsController.BP_Catalog_No.value = Value;
            //     }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hintText: 'Is Default',
                onChanged: (Value) {
                  itemsController.Is_Default.value = Value;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hintText: 'BP Catalog Decription',
                onChanged: (Value) {
                  itemsController.BP_Catalog_Description.value = Value;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hintText: 'Technical Specification',
                onChanged: (Value) {
                  itemsController.Technical_Specification.value = Value;
                }),
            const Spacer(),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ButtonBS(
                      title: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      textColor: Colors.white,
                      backgroundColor: Colors.blue,
                      borderRadius: 12,
                      height: 40,
                      onPressed: () {
                        Get.back();
                      },
                    )),
                const Spacer(),
                Obx(
                  () => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: itemsController.postBPCatalogueLoading.value ==
                              true
                          ? CircularProgressIndicator()
                          : ButtonBS(
                              title: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              textColor: Colors.white,
                              backgroundColor: Colors.blue,
                              borderRadius: 12,
                              height: 40,
                              onPressed: () async {
                                await itemsController.postBPCatalogue();
                                // Navigator.of(context).pop();
                                if (itemsController.BP_Name.value != '' &&
                                    itemsController.bp_catalog_status.value ==
                                        "ok") {
                                  _showDialog(context, 'success');
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Items4()));
                                  });
                                } else {
                                  if (itemsController.BP_Name.value == '') {
                                    _showDialog(
                                        context, 'fill all required fields');
                                  } else {
                                    _showDialog(context, 'error');
                                  }
                                }
                                // Get.to(() => const Items4());
                              },
                            )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, String text1) {
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
        content: Text(text1),
      );
    },
  );

  // Automatically close the dialog after 2 seconds
  Future.delayed(Duration(seconds: 1), () {
    Navigator.of(context).pop();
  });
}
