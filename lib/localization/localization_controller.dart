import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  final _locale = const Locale('en').obs;

  Locale get locale => _locale.value;

  void setLocale(Locale locale) {
    _locale.value = locale;
  }
}
