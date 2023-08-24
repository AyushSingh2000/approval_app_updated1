// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/items/presentation/pages/items_add3.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/TextField/customTextField.dart';

import '../../controller/items_controller.dart';

class Items2 extends StatefulWidget {
  const Items2({super.key});

  @override
  State<Items2> createState() => _Items2State();
}

class _Items2State extends State<Items2> {
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

  ItemsController itemsController = Get.find<ItemsController>();
  List<String> demo = ['hello', 'hello', 'hello'];

  @override
  Widget build(BuildContext context) {
    print('sdfghj${itemsController.cardCode.value}');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Warehouses"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Obx(() {
            final WhseList = Get.find<ItemsController>()
                .WhseList
                .map((element) => element.toString())
                .toList();
            // return DropdownButtonFormField<String>(
            //   hint: const Text(
            //     'select items',
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   isExpanded: true,
            //   decoration: InputDecoration(
            //     filled: true, //<-- SEE HERE
            //     fillColor: const Color.fromARGB(255, 225, 225, 225),
            //     labelText: 'Whse Name',
            //     border:
            //         OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            //   ),
            //   onChanged: (newValue) {
            //     itemsController.Whse_Name.value = newValue!;
            //     // itemsController.Whse_Code.value =
            //     //     itemsController.WhseMapData[newValue!];
            //   },
            //   items: WhseList.map((String value) {
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
                  labelText: WhseList.isEmpty
                      ? 'No Whse name Found'
                      : 'Select Whse name',
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
                options: WhseList,
                onChanged: (dynamic newValue) {
                  itemsController.Whse_Name.value = newValue!;
                },
              ),
            );
          }),
          // dropdownform(dropdown: 'Whse Code', dropdownitems: demo),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => CustomTextField(
              hintText: itemsController
                          .WhseMapData[itemsController.Whse_Name.value] ==
                      null
                  ? 'Whse Code'
                  : itemsController.WhseMapData[itemsController.Whse_Name.value]
                      .toString(),
              keyboardType: TextInputType.none,
              enable: false,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
              hintText: 'In stock',
              onChanged: (Value) {
                itemsController.In_Stock.value = Value;
              }),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
              hintText: 'Committed',
              onChanged: (Value) {
                itemsController.Committed.value = Value;
              }),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
              hintText: 'Ordered',
              onChanged: (Value) {
                itemsController.Ordered.value = Value;
              }),
          const Spacer(),

          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ButtonBS(
                    title: 'Back',
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
                    child: itemsController.postItemMasterLoading.value == true
                        ? CircularProgressIndicator()
                        : ButtonBS(
                            title: 'Next',
                            textColor: Colors.white,
                            backgroundColor: Colors.blue,
                            borderRadius: 12,
                            height: 40,
                            onPressed: () async {
                              await itemsController.postItemMaster();
                              // print(res.postResponseEnum);
                              if (itemsController.cardCode.value.isNotEmpty &&
                                  itemsController.catalog_status.value ==
                                      "success" &&
                                  itemsController.Whse_Name.value != '') {
                                // Navigator.of(context).pop();
                                _showDialog(context,
                                    itemsController.catalog_status.value);

                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => Items3()));
                                });
                                // Get.to(() => const Items3());
                              } else {
                                if (itemsController.Whse_Name.value == '') {
                                  _showDialog(
                                      context, 'Fill all required fields');
                                } else {
                                  _showDialog(context,
                                      itemsController.catalog_status.value);
                                }
                              }
                            },
                          )),
              )
            ],
          )
        ]),
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
