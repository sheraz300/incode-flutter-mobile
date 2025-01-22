import 'dart:convert';

import 'package:incode/models/registeration_model.dart';
import 'package:incode/screens/home_screen.dart';
import 'package:incode/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incode/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RxBool isPasswordVisible = false.obs;
  RxBool isRegistered = false.obs;
  RegisterationResponseModel? registerationResponseModel;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  Future<void> registerWithEmail() async {
    isRegistered.value = true;
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      // Account Created Always Status Code 201
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        registerationResponseModel = RegisterationResponseModel.fromJson(json);
        if (registerationResponseModel != null) {
          if (registerationResponseModel!.id.isNotEmpty) {
            registerationResponseModelGlobal = registerationResponseModel;

            Get.snackbar('Success', 'User Registered',
                backgroundColor: Colors.green);
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            isRegistered.value = false;
            Get.off(const HomeScreen());
          } else {
            isRegistered.value = false;

            Get.snackbar('Error', 'Email Already Registered');
          }
        } else {
          isRegistered.value = false;

          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        isRegistered.value = false;

        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
