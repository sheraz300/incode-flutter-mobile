import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt pageNo = 0.obs;
  PageController pageCtrl = PageController();
  RxInt browsePageNo = 0.obs;
  PageController browsePageCtrl = PageController();
  int navbarPageNo = 0;
  PageController navBarPageCtrl = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}
