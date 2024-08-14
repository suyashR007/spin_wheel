import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_wheel/constants/list.dart';
import 'package:spin_wheel/widgets/my_alert_dialog.dart';
import 'package:spin_wheel/widgets/primary_textfield.dart';

class SpinnerController extends GetxController {
  SpinnerController() {
    selected = StreamController<int>();
    answerController = TextEditingController();
  }
  late final StreamController<int> selected;
  late final TextEditingController answerController;
  int randomIndex = 0;

  void spinWheel() {
    final random = Random();
    randomIndex = random.nextInt(questions.length);
    selected.add(randomIndex);
  }

  showSheet() async {
    String questionAsk = questions[randomIndex];

    Get.dialog(
      alertDialog(questionAsk),
    ).then(
      (value) {
        answerController.text = '';
      },
    );
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }
}
