import 'dart:convert';

import 'package:incode/models/login_model.dart';
import 'package:incode/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incode/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:incode/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  RxBool isLoading = false.obs;
  RxBool islogging = false.obs;
  RxBool isPasswordVisible = false.obs;

  LoginResponseModel? loginResponseModel;

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

  Future<void> loginWithEmail() async {
    islogging.value = true;
    try {
      var headers = {'Cookie': 'session=756587a9-a689-4a93-a05e-c7443a78c4e3'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://www.in-code.it/api/1/sign-in'));
      request.fields.addAll({
        'version': '1',
        'email': emailController.text,
        'password': passwordController.text,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        islogging.value = false;
        var data = jsonDecode(await response.stream.bytesToString());
        loginResponseModel = LoginResponseModel.fromJson(data);
        if (loginResponseModel != null) {
          loginResponseModelGlobal = loginResponseModel;
          if (loginResponseModel?.userId != 0) {
            emailController.clear();
            passwordController.clear();
            Get.off(const HomeScreen());
          }
        }
      } else {
        islogging.value = false;
        debugPrint(response.reasonPhrase);
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text(
                'Error',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "${response.reasonPhrase.toString()} User, please check your credentials.",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 20,
                  child: SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Okay',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      islogging.value = false;

      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
