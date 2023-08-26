// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/controller/customer_controller.dart';

import '../../../../ui/Buttons/buttonBS.dart';
import '../../../../ui/TextField/customTextField.dart';

// ignore: must_be_immutable
class SupplierEditPage extends StatefulWidget {
  int index;
  SupplierEditPage(this.index, {super.key});

  @override
  State<SupplierEditPage> createState() => _SupplierEditPageState();
}

class _SupplierEditPageState extends State<SupplierEditPage> {
  List<String> list3 = ['yes', 'no'];

  @override
  Widget build(BuildContext context) {
    final CustomerController customer_Controller =
        Get.put<CustomerController>(CustomerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Edit contact',
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hintText: 'Title',
                  intialvalue:
                      customer_Controller.contactemployee[widget.index].Title,
                  onChanged: (p0) {
                    customer_Controller.contactemployee[widget.index].Title =
                        p0;
                    // customer_Controller.update();
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hintText: 'First Name *',
                  intialvalue: customer_Controller
                      .contactemployee[widget.index].FirstName,
                  onChanged: (p0) {
                    customer_Controller
                        .contactemployee[widget.index].FirstName = p0;
                    // customer_Controller.refresh();
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Middle Name',
                intialvalue: customer_Controller
                    .contactemployee[widget.index].MiddleName,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].MiddleName = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Last Name',
                intialvalue:
                    customer_Controller.contactemployee[widget.index].LastName,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].LastName = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Contact Name *',
                intialvalue:
                    customer_Controller.contactemployee[widget.index].Name,
                onChanged: (p0) =>
                    customer_Controller.contactemployee[widget.index].Name = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Position *',
                intialvalue:
                    customer_Controller.contactemployee[widget.index].Position,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].Position = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Telephone',
                intialvalue:
                    customer_Controller.contactemployee[widget.index].Phone1,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].Phone1 = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Mobile no *',
                intialvalue: customer_Controller
                    .contactemployee[widget.index].MobilePhone,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].MobilePhone = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Email ID',
                intialvalue:
                    customer_Controller.contactemployee[widget.index].E_Mail,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].E_Mail = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Date of Birth',
                intialvalue: customer_Controller
                    .contactemployee[widget.index].DateOfBirth,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].DateOfBirth = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              // CustomTextField(
              //   hintText: 'Date of Anniversary',
              //   intialvalue:
              //       customer_Controller.contactemployee[widget.index].an,
              //   onChanged: (p0) => customer_Controller
              //       .contactemployee[widget.index].an = p0,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              CustomTextField(
                hintText: 'Address',
                intialvalue:
                    customer_Controller.contactemployee[widget.index].Address,
                onChanged: (p0) => customer_Controller
                    .contactemployee[widget.index].Address = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                hint: const Text(
                  'Select items',
                  style: TextStyle(color: Colors.black),
                ),
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromARGB(255, 225, 225, 225),
                  labelText: 'Active *',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (newValue) {
                  customer_Controller.contactemployee[widget.index].Active =
                      newValue!;
                },
                items: list3.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              // const Text(
              //   '* fields are required',
              //   style: TextStyle(color: Colors.blue),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              ButtonBS(
                onPressed: () {
                  customer_Controller.contactemployee.refresh();
                  Get.back();
                },
                title: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blue,
                width: 100,
                height: 40,
                textColor: Colors.white,
                borderRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
