import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inventory/services/api.dart';
import 'package:inventory/services/user.dart';

import '../models/inventory.dart';
import '../models/user.dart';

class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _TestState();
}

// get user's inventory
// first get current user
// then get its inventory store in the string.
class _TestState extends State<Test> {
  List<String> inventoryList = List<String>.empty();
  User u = UserService.instance.currentUser!;
  final myController = TextEditingController();
  String items = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("test request"),
        ),
        body: Column(
          children: [
            TextField(
              controller: myController,
              
            ),
            ElevatedButton(
              child: const Text("test"),
              onPressed: () {
                User u = UserService.instance.currentUser!;
                inventoryList.add(myController.text);
                APIService.instance.addItems(u.uid, inventoryList);
                log(u.fname);
              },
            ),
          ],
        ));
  }
}
