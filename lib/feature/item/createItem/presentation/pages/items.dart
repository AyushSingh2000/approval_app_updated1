import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../pages/items_add.dart';


class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const ItemsAddPage());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: const Center(
        child: Text('Items List'),
      ),
    );
  }
}
