import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/TextField/customTextField.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../approved_item/controller/approved_item_controller.dart';
import '../../controller/items_controller.dart';

class Items4 extends StatefulWidget {
  const Items4({super.key});

  @override
  State<Items4> createState() => _Items4State();
}

class _Items4State extends State<Items4> {
  int count = 0;
  ApprovedItemController ac =
      Get.put<ApprovedItemController>(ApprovedItemController());
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
    ItemsController itemsController = Get.put(ItemsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarmainblue,
        title: const Text("Alternatives Items"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              final itemNumberList = Get.find<ItemsController>()
                  .itemNumberList
                  .map((element) => element.toString())
                  .toList();
              // return DropdownButtonFormField<String>(
              //   isExpanded: true,
              //   hint: const Text(
              //     'select options',
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   decoration: InputDecoration(
              //     filled: true, //<-- SEE HERE
              //     fillColor: const Color.fromARGB(255, 225, 225, 225),
              //     labelText: 'Item name',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //   ),
              //   onChanged: (newValue) {
              //     itemsController.Item_Name_alt.value = newValue!;
              //   },
              //   items: itemNumberList.map((String value) {
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
                    labelText: itemNumberList.isEmpty
                        ? 'No Item Name Found'
                        : 'Select Item Name',
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
                  options: itemNumberList,
                  onChanged: (dynamic newValue) {
                    itemsController.Item_Name_alt.value = newValue!;
                  },
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => CustomTextField(
                hintText: itemsController.itemNumberMapData[
                            itemsController.Item_Name_alt.value] ==
                        null
                    ? 'Item Code'
                    : itemsController
                        .itemNumberMapData[itemsController.Item_Name_alt.value]
                        .toString(),
                keyboardType: TextInputType.none,
                enable: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hintText: 'Item Desciption',
                onChanged: (Value) {
                  itemsController.Item_Description.value = Value;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hintText: 'Match Factor',
                onChanged: (Value) {
                  itemsController.Match_Factor.value = Value;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hintText: 'Remarks',
                onChanged: (Value) {
                  itemsController.Remark_.value = Value;
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
                      backgroundColor: AppColors.mainblue,
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
                      child: itemsController.postAlternativeItemLoading.value ==
                              true
                          ? CircularProgressIndicator()
                          : ButtonBS(
                              title: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              textColor: Colors.white,
                              backgroundColor: AppColors.mainblue,
                              borderRadius: 12,
                              height: 40,
                              onPressed: () async {
                                await itemsController.postAlternativeItem();

                                if (itemsController.Item_Name_alt.value != '' &&
                                    itemsController.alternative_status.value ==
                                        "ok") {
                                  _showDialog(context, 'success');

                                  Navigator.popUntil(context, (route) {
                                    return count++ == 3;
                                  });
                                  ac.getApprovedItemData();
                                } else {
                                  if (itemsController.Item_Name_alt.value ==
                                      '') {
                                    _showDialog(
                                        context, 'fill all required fields');
                                  } else {
                                    _showDialog(context, 'error');
                                  }
                                }
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
