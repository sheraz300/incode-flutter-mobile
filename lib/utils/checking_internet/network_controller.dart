import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:incode/utils/utils.dart';

class InternetCheckingController extends GetxController {
  RxBool isConnected = false.obs;
  RxBool isConnectedStatus = false.obs;
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    initializeConnectivity();
    checkConnectivityStream();
  }

  void checkConnectivityStream() async {
    _streamSubscription = Connectivity().onConnectivityChanged.listen(
      (status) async {
        switch (status) {
          case ConnectivityResult.ethernet:
          case ConnectivityResult.mobile:
          case ConnectivityResult.wifi:
            if (isConnected.value == false) {
              isConnected.value = true;
              // rootNavigatorKey.currentState?.context.pop();
              if (WidgetsFlutterBinding.ensureInitialized()
                      .firstFrameRasterized &&
                  isConnectedStatus.value == true) {
                isConnectedStatus.value = false;
                Get.back();
              }

              log.i('Yesssssssss Net......................');
            }
            break;
          default:
            // if (isConnected.value != false) {
            isConnected.value = false;
            // rootNavigatorKey.currentState?.context
            //     .pushNamed(AppRoutes.NO_INTERNET);
            if (WidgetsFlutterBinding.ensureInitialized()
                    .firstFrameRasterized &&
                isConnectedStatus.value == false) {
              isConnectedStatus.value = true;

              Get.toNamed("/noInternet-screen");
            }
            log.i('No Net......................');
            // ignore: avoid_single_cascade_in_expression_statements
            // }

            break;
        }
      },
    );
  }

  Future<void> initializeConnectivity() async {
    ConnectivityResult connectionStatus =
        await Connectivity().checkConnectivity();

    switch (connectionStatus) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        isConnected.value = true;
        break;
      default:
        isConnected.value = false;
        break;
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
