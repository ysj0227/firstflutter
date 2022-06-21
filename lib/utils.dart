library utils_lib;

import 'dart:ui';

double screenWidth() {
  final width = window.physicalSize.width;
  return width;
}

double screenHeight() {
  final height = window.physicalSize.height;
  return height;
}

List<Map> bannerList() {
  List<Map> imageList = [
    {
      "url":
          "http://121.40.217.82:8001/uploads/20220210/c34b3aca28ac8e90357c9719fe7894cb.png"
    },
    {
      "url":
          "http://121.40.217.82:8001/uploads/20220210/967d1c169469dffedcf1d8b62a5f763d.png"
    },
    {
      "url":
          "http://121.40.217.82:8001/uploads/20220210/967d1c169469dffedcf1d8b62a5f763d.png"
    }
  ];
  return imageList;
}
