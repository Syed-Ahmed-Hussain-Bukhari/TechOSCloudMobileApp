import 'package:get/get.dart';

class PlayerVideosScreenController extends GetxController {
  var selectedTabIndex = 0.obs;
  void changeTab(int index) => selectedTabIndex.value = index;
}