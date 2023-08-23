import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/controller/customer_controller.dart';
import 'package:new_app/ui/TextField/customTextField.dart';

class AddContactDialog extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                if (name.isNotEmpty && email.isNotEmpty) {
                  // Contact newContact = Contact(name: name, email: email);

                  // Navigator.of(context).pop(newContact);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class textfieldinput extends StatelessWidget {
  final String title;
  const textfieldinput(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: title,
    );
  }
}

class dropdownform extends StatefulWidget {
  final String dropdown;
  final List<String> dropdownitems;
  dropdownform({required this.dropdown, required this.dropdownitems});

  @override
  State<dropdownform> createState() => _dropdownformState();
}

class _dropdownformState extends State<dropdownform> {
  @override
  Widget build(BuildContext context) {
    RxString string = ''.obs;
    // ignore: unused_local_variable
    late String selectedDropdownValue =
        widget.dropdownitems.isNotEmpty ? widget.dropdownitems[0] : 'select';
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: Text(
        'Select items',
        style: TextStyle(color: Colors.black),
      ),
      // value: selectedDropdownValue,
      decoration: InputDecoration(
        filled: true, //<-- SEE HERE
        fillColor: const Color.fromARGB(255, 225, 225, 225),
        labelText: widget.dropdown,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged: (newValue) {
        setState(() {
          selectedDropdownValue = newValue!;
          string.value = newValue;
        });
      },
      items: widget.dropdownitems.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class address extends StatefulWidget {
  final String adress_type;
  const address(this.adress_type, {super.key});

  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  final CustomerController customer_Controller = Get.find<CustomerController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bpcountryList = customer_Controller.BPCountriesList.map(
          (element) => element.toString()).toList();
      final bpstateList =
          customer_Controller.BPStatesList.map((element) => element.toString())
              .toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.adress_type),
          SizedBox(height: 16.0),

          const textfieldinput('Building/Floor/Room'), //Building/Floor/Room
          const SizedBox(height: 16.0),
          const textfieldinput('Block'), //Block
          const SizedBox(height: 16.0),
          const textfieldinput('Street'), //Street
          const SizedBox(height: 16.0),
          const textfieldinput('City'), //City
          const SizedBox(height: 16.0),

          dropdownform(
              dropdown: 'Country', dropdownitems: bpcountryList), //Country
          const SizedBox(height: 16.0),

          dropdownform(dropdown: 'State', dropdownitems: bpstateList), //State
          const SizedBox(height: 16.0),

          const textfieldinput('Zip Code'), //Zip Code
          const SizedBox(height: 16.0),

          const textfieldinput('Ship To County'), //Ship To County
          const SizedBox(height: 16.0),

          const textfieldinput('AddressID'), //AddressID
          const SizedBox(height: 16.0),
        ],
      );
    });
  }
}
