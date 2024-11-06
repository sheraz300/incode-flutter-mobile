// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:animate_do/animate_do.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:incode/common_widgets/app_textfield.dart';
import 'package:incode/common_widgets/custome_webview.dart';
import 'package:incode/constants/input_formatters.dart';
import 'package:incode/custom_widgets/custom_loader.dart';
import 'package:incode/controllers/login_controller.dart';
import 'package:incode/localization/localization_controller.dart';
import '../../constants/validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends GetView<LoginController> {
  AuthScreen({super.key});
  final loginFormKey = GlobalKey<FormState>();

  var locController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // List of language options
    final localize = AppLocalizations.of(context)!;
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height * 0.75,
                  child: ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            Color(0xFFDD1527),
                            Color(0xFF7D0C16),
                          ],
                        ),
                      ),
                      child: FadeInUp(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Form(
                            key: loginFormKey,
                            child: ListView(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              padding: EdgeInsets.zero,
                              children: [
                                SizedBox(
                                  height: height * 0.15,
                                ),
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 100,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  AppLocalizations.of(context)!.login,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                CustomTextFormField(
                                  cursorColor: Colors.black,
                                  title: AppLocalizations.of(context)!.email,
                                  isRequired: true,
                                  hintText:
                                      AppLocalizations.of(context)!.email_hint,
                                  controller: controller.emailController,
                                  validator: controller.validateEmail,
                                  inputFormatters: InputFormat.denySpace,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
                                  suffixWidget: Icon(
                                    Icons.email,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Obx(
                                  () => CustomTextFormField(
                                    cursorColor: Colors.black,
                                    title:
                                        AppLocalizations.of(context)!.password,
                                    isRequired: true,
                                    hintText: AppLocalizations.of(context)!
                                        .password_hint,
                                    controller: controller.passwordController,
                                    validator: controller.validatePassword,
                                    keyboardType: TextInputType.text,
                                    obscureText:
                                        !controller.isPasswordVisible.value,
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    inputFormatters: InputFormat.denySpace,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        controller.togglePassword();
                                      },
                                      child: Icon(
                                        controller.isPasswordVisible.value
                                            ? EneftyIcons.eye_slash_bold
                                            : EneftyIcons.eye_bold,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .forget_password,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                // const Text(
                //   'Login with Touch Id',
                //   style: TextStyle(
                //     color: Color(0xFFAEA7A7),
                //     fontSize: 12,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // const SizedBox(height: 20),
                // Container(
                //   padding: const EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(
                //       color: Colors.orange,
                //       width: 2,
                //     ),
                //   ),
                //   child: const Icon(Icons.fingerprint_outlined, size: 40),
                // ),
                // const SizedBox(height: 20),
                // const Text(
                //   'Or connect with ',
                //   style: TextStyle(
                //     color: Color(0xFFAEA7A7),
                //     fontSize: 12,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // buildReg(localize),
                const Spacer(),
                _buildCompanyText(localize)
              ],
            ),
            Positioned(
              top: height * 0.71,
              right: 0,
              left: 0,
              child: _buildLoginBtn(controller, localize),
            ),
            Positioned(
              top: height * 0.08,
              right: height * 0.02,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors
                      .transparent, // Transparent background for no visible border
                ),
                child: DropdownButton<String>(
                  value:
                      controller.dropdownValue.value, // Use the selected value
                  icon: Icon(Icons.arrow_drop_down,
                      color: Colors.white), // White icon color
                  dropdownColor:
                      Colors.black, // Background color of dropdown menu
                  style: TextStyle(
                    color: Colors.white, // Selected value color
                  ),
                  underline: Container(), // Removes the underline/border
                  onChanged: (String? value) {
                    if (value != null) {
                      controller.dropdownValue.value = value;

                      locController.setLocale(Locale(value));
                      Get.updateLocale(
                          Locale(value)); // Switch to the selected locale
                    }
                  },
                  items: controller.list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value == 'en' ? 'English' : 'Italian',
                        style: TextStyle(
                          color: Colors
                              .white, // Set dropdown item text color to white
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _buildLoginBtn(
      LoginController controller, AppLocalizations localize) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(AppRoutes.DASHBOARD);
        if (loginFormKey.currentState!.validate()) {
          controller.loginWithEmail();
        }
      },
      child: Center(
        child: Container(
          width: 170,
          height: 53,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 9.90,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Obx(
            () => controller.islogging.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF7D0C16),
                    ),
                  )
                : Text(
                    localize.login,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Text _buildCompanyText(AppLocalizations localize) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: localize.created_with,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: "  ${localize.company}",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to CustomWebviewScreen
                Get.to(() => CustomWebviewScreen(
                      url: "https://www.fenixhub.it/",
                    )); // Use GetX for navigation
                // OR, if not using GetX, use Navigator.push:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CustomWebviewScreen()),
                // );
              },
          ),
        ],
      ),
    );
  }

  Widget buildReg(AppLocalizations localize) {
    return InkWell(
      onTap: () {
        controller.emailController.clear();
        controller.passwordController.clear();
        Get.offAllNamed("/signup-screen");
      },
      child: Container(
        height: 66,
        color: Colors.black,
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: localize.no_account,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "  ${localize.register_now}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
