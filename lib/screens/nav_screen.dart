import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdrive_clone/controllers/navigation_controller.dart';
import 'package:gdrive_clone/screens/files_screen.dart';
import 'package:gdrive_clone/screens/storage_screen.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../widgets/header.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25) ,
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Header(),
          Obx(
              ()=> Get.find<NavigationController>().tab.value == "Storage" ? StorageScreen() : FilesScreen()
          ),
        ],
      ),
    );
  }
}
