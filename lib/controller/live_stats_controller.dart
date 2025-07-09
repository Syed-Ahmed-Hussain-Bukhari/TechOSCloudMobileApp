import 'package:get/get.dart';

class LiveStatsController extends GetxController {
  var liveStatsMap = <String, String>{}.obs;
  var latestRecordedPath = ''.obs;

  void addLiveStatsVideo(String fileName, String path) {
    liveStatsMap[fileName] = path;
    latestRecordedPath.value = path;
  }

  void setLatestPath(String path) {
    latestRecordedPath.value = path;
  }

  void removeLiveStatsVideo(String fileName) {
    liveStatsMap.remove(fileName);
  }

  void clearAllLiveStatsVideos() {
    liveStatsMap.clear();
    latestRecordedPath.value = '';
  }

  Map<String, String> get allLiveStatsVideos => liveStatsMap;
}
