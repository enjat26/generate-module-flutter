// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/name_controller.dart';

// ignore: must_be_immutable
class NameScreen extends StatelessWidget {
  final NameController _ctrlName = Get.find();

  NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
