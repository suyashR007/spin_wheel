import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_wheel/controllers/spinner_controller.dart';
import 'package:spin_wheel/widgets/primary_textfield.dart';

AlertDialog alertDialog(String questionAsk) {
  final spinnerController = Get.find<SpinnerController>();
  return AlertDialog(
    title: Text(
      questionAsk,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    content: PrimaryTextField(
      controller: spinnerController.answerController,
      hintText: 'Type your Answer here',
      onChanged: (p0) {},
      keyboard: TextInputType.text,
      maxlines: 4,
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('OK'),
      ),
    ],
  );
}
