import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxString tab = "Storage".obs;

  changeTab(String selectedTab) {
    tab.value = selectedTab;
  }
}