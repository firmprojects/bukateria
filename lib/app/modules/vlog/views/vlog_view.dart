import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vlog_controller.dart';

class VlogView extends GetView<VlogController> {
  const VlogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VlogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VlogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
