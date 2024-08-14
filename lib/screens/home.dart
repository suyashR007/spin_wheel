import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_wheel/controllers/spinner_controller.dart';
import 'package:spin_wheel/widgets/spinning_wheel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(SpinnerController());
  }

  @override
  void dispose() {
    super.dispose();
    Get.find<SpinnerController>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spinning Wheel App'),
      ),
      body: const SpinningWheel(),
    );
  }
}
