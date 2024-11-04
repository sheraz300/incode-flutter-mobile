// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:animate_do/animate_do.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:incode/common_widgets/app_textfield.dart';
import 'package:incode/constants/input_formatters.dart';
import 'package:incode/controllers/registeration_controller.dart';
import 'package:incode/custom_widgets/custom_loader.dart';
import 'package:incode/controllers/login_controller.dart';
import '../../constants/validators.dart';

class SignupScreen extends GetView<RegisterationController> {
  SignupScreen({super.key});

  final regFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                          key: regFormKey,
                          child: ListView(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            padding: EdgeInsets.zero,
                            children: [
                              SizedBox(
                                height: height * 0.11,
                              ),
                              Image.asset(
                                'assets/images/logo.png',
                                height: 100,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Register',
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
                                title: 'Name',
                                isRequired: true,
                                hintText: 'johnmac',
                                controller: controller.nameController,
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                cursorColor: Colors.black,
                                title: 'Email',
                                isRequired: true,
                                hintText: 'johnmac@gmail.com',
                                controller: controller.emailController,
                                validator: controller.validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: const [AutofillHints.email],
                              ),
                              const SizedBox(height: 15),
                              Obx(
                                () => CustomTextFormField(
                                  cursorColor: Colors.black,
                                  title: 'Password',
                                  isRequired: true,
                                  hintText: 'Your Password',
                                  controller: controller.passwordController,
                                  keyboardType: TextInputType.text,
                                  obscureText:
                                      !controller.isPasswordVisible.value,
                                  autofillHints: const [AutofillHints.password],
                                  inputFormatters: InputFormat.denySpace,
                                  suffixWidget: InkWell(
                                    onTap: () {
                                      controller.togglePassword();
                                    },
                                    child: Icon(
                                      controller.isPasswordVisible.value
                                          ? EneftyIcons.eye_slash_bold
                                          : EneftyIcons.eye_bold,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
              const Spacer(),

              buildReg(),

              const Spacer(),
              _buildCompanyText()
            ],
          ),
          Positioned(
              top: height * 0.71,
              right: 0,
              left: 0,
              child: _buildLoginBtn(controller)),
        ],
      ),
    );
  }

  GestureDetector _buildLoginBtn(RegisterationController controller) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(AppRoutes.DASHBOARD);
        if (regFormKey.currentState!.validate()) {
          controller.registerWithEmail();
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
            () => controller.isRegistered.value
                ? Center(
                  child: CircularProgressIndicator(
                      color: Color(0xFF7D0C16),
                    ),
                )
                : const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff4D7EF9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Text _buildCompanyText() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Created with <3 by',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '  Fenix ​​HUB',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReg() {
    return InkWell(
      onTap: () {
        Get.offAllNamed("/auth-screen");
      },
      child: Container(
        height: 66,
        color: Colors.black,
        alignment: Alignment.center,
        child: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' Login Now',
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
