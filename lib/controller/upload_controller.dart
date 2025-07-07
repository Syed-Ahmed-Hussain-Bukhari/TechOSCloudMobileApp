// import 'package:get/get.dart';

// class UploadController extends GetxController {
//   var uploadedVideoPath = ''.obs;

//   void setVideoPath(String path) {
//     uploadedVideoPath.value = path;
//   }
// }

// upload_controller.dart
// lib/controller/upload_controller.dart

import 'package:get/get.dart';

class UploadController extends GetxController {
  var videoMap = <String, String>{}.obs;
  var uploadedVideoPath = ''.obs;

  void addVideo(String fileName, String path) {
    videoMap[fileName] = path;
    uploadedVideoPath.value = path;
  }

  void setVideoPath(String path) {
    uploadedVideoPath.value = path;
  }

  void removeVideo(String fileName) {
    videoMap.remove(fileName);
  }

  void clearAllVideos() {
    videoMap.clear();
    uploadedVideoPath.value = '';
  }

  Map<String, String> get uploadedVideos => videoMap;
}

