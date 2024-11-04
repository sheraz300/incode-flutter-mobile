// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ticket_management_system/utils/utils.dart';
// import 'package:universal_platform/universal_platform.dart';

// import '../constants/app_sizes.dart';

/// this method will show black overlay which look like dialog
/// and it will have loading animation inside of it
/// this will make sure user cant interact with ui until
/// any (async) method is executing cuz it will wait for async function
/// to end and then it will dismiss the overlay
///
class CustomLoading {
  late BuildContext context;

  CustomLoading(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(context, rootNavigator: true).pop();
  }
  //     Future<void> showError(Object? error) async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       action: SnackBarAction(
  //         label: 'Dismiss',
  //         onPressed: () {
  //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //         },
  //       ),
  //       backgroundColor: Colors.red,
  //       content: Text(handleError(error)),
  //     ),
  //   );
  // }
}
// class CustomLoading {

//   // Future<T?> showLoadingOverLay<T>({required AsyncCallback future}) async {
//   //   if (UniversalPlatform.isIOS) {
//   //     await Get.showOverlay(
//   //       asyncFunction: () async {
//   //         try {
//   //           return await future();
//   //         } catch (error) {
//   //           log.e(error);
//   //         }
//   //       },
//   //       loadingWidget: Scaffold(
//   //         backgroundColor: Colors.black.withOpacity(0.5),
//   //         body: Center(
//   //           child: CupertinoActivityIndicator(
//   //             radius: Sizes.ICON_SIZE_30,
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   } else {
//   //     await Get.showOverlay(
//   //       asyncFunction: () async {
//   //         try {
//   //           return await future();
//   //         } catch (error) {
//   //           log.e(error);
//   //         }
//   //       },
//   //       loadingWidget: const Center(child: CircularProgressIndicator()),
//   //       opacity: 0.3,
//   //       opacityColor: Colors.black,
//   //     );
//   //   }

//   //   return null;
//   // }

//   // static SpinKitThreeBounce get spinKitThreeBounceDark =>
//   //     SpinKitThreeBounce(color: Get.theme.primaryColor, size: Sizes.HEIGHT_20);

//   // static SpinKitThreeBounce get spinKitThreeBounceLight =>
//   //     const SpinKitThreeBounce(color: Colors.white, size: Sizes.HEIGHT_20);

//   static CupertinoActivityIndicator get cupertinoLarge =>
//       const CupertinoActivityIndicator(radius: Sizes.ICON_SIZE_20);

//   static CupertinoActivityIndicator get cupertinoMedium =>
//       const CupertinoActivityIndicator(radius: Sizes.ICON_SIZE_14);

//   static CupertinoActivityIndicator get cupertinoSmall =>
//       const CupertinoActivityIndicator(radius: Sizes.ICON_SIZE_10);
// }