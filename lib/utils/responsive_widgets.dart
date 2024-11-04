import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? mobileLarge;
  final Widget? tabletSmall;
  final Widget? tablet;
  final Widget? desktop;

  // Functions for builder
  final Widget Function()? mobileX;
  final Widget Function()? mobileLargeX;
  final Widget Function()? tabletSmallX;
  final Widget Function()? tabletX;
  final Widget Function()? desktopX;

  final bool showDeviceLogs;

  const Responsive({
    super.key,
    required this.mobile,
    this.mobileLarge,
    this.tabletSmall,
    this.tablet,
    this.desktop,
    this.showDeviceLogs = false,
  })  : mobileX = null,
        mobileLargeX = null,
        tabletSmallX = null,
        tabletX = null,
        desktopX = null;

  const Responsive.builder({
    super.key,
    required this.mobileX,
    this.mobileLargeX,
    this.tabletSmallX,
    this.tabletX,
    this.desktopX,
    this.showDeviceLogs = false,
  })  : mobile = null,
        mobileLarge = null,
        tabletSmall = null,
        tablet = null,
        desktop = null;

  static bool isMobile() => Get.width < 520;
  static bool isMobileLarge() => Get.width >= 520 && Get.width < 700;
  static bool get isMobileOrMobileLarge => isMobile() || isMobileLarge();

  static bool isTabletSmall() => Get.width >= 700 && Get.width < 1000;
  static bool isTablet() => Get.width >= 1000 && Get.width < 1400;

  static bool isDesktop() => Get.width >= 1400;

  static T value<T>({
    required T mobile,
    T? mobileLarge,
    T? tabletSmall,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop()) {
      return desktop ?? tablet ?? tabletSmall ?? mobileLarge ?? mobile;
    } else if (isTablet()) {
      return tablet ?? tabletSmall ?? mobileLarge ?? mobile;
    } else if (isTabletSmall()) {
      return tabletSmall ?? mobileLarge ?? mobile;
    } else if (isMobileLarge()) {
      return mobileLarge ?? mobile;
    } else {
      return mobile;
    }
  }

  static void callback({
    required VoidCallback mobile,
    VoidCallback? mobileLarge,
    VoidCallback? tabletSmall,
    VoidCallback? tablet,
    VoidCallback? desktop,
  }) {
    if (isDesktop()) {
      return (desktop ?? tablet ?? tabletSmall ?? mobileLarge ?? mobile)();
    } else if (isTablet()) {
      return (tablet ?? tabletSmall ?? mobileLarge ?? mobile)();
    } else if (isTabletSmall()) {
      return (tabletSmall ?? mobileLarge ?? mobile)();
    } else if (isMobileLarge()) {
      return (mobileLarge ?? mobile)();
    } else {
      return mobile();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mobileX != null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          // print("Get.height : ${Get.height}");
          // print("Get.width : ${Get.width}");
          // print("Get.context!.width : ${Get.context!.width}");
          // print("constraints.minWidth : ${constraints.minWidth}");
          // print("constraints.maxWidth : ${constraints.maxWidth}");

          if (isDesktop()) {
            _showLog("DESKTOP => Width: ${Get.width}, Height: ${Get.height}");
            return (desktopX ??
                    tabletX ??
                    tabletSmallX ??
                    mobileLargeX ??
                    mobileX!)
                .call();
          } else if (isTablet()) {
            _showLog("TABLET => Width: ${Get.width}, Height: ${Get.height}");
            return (tabletX ?? tabletSmallX ?? mobileLargeX ?? mobileX!).call();
          } else if (isTabletSmall()) {
            _showLog(
                "TABLET SMALL => Width: ${Get.width}, Height: ${Get.height}");
            return (tabletSmallX ?? mobileLargeX ?? mobileX!).call();
          } else if (isMobileLarge()) {
            _showLog(
                "MOBILE LARGE => Width: ${Get.width}, Height: ${Get.height}");
            return (mobileLargeX ?? mobileX!).call();
          } else {
            _showLog("MOBILE => Width: ${Get.width}, Height: ${Get.height}");
            return (mobileX!).call();
          }
        },
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // print("Get.height : ${Get.height}");
        // print("Get.width : ${Get.width}");
        // print("Get.context!.width : ${Get.context!.width}");
        // print("constraints.minWidth : ${constraints.minWidth}");
        // print("constraints.maxWidth : ${constraints.maxWidth}");

        if (isDesktop()) {
          _showLog("DESKTOP => Width: ${Get.width}, Height: ${Get.height}");
          return desktop ?? tablet ?? tabletSmall ?? mobileLarge ?? mobile!;
        } else if (isTablet()) {
          _showLog("TABLET => Width: ${Get.width}, Height: ${Get.height}");
          return tablet ?? tabletSmall ?? mobileLarge ?? mobile!;
        } else if (isTabletSmall()) {
          _showLog(
              "TABLET SMALL => Width: ${Get.width}, Height: ${Get.height}");
          return tabletSmall ?? mobileLarge ?? mobile!;
        } else if (isMobileLarge()) {
          _showLog(
              "MOBILE LARGE => Width: ${Get.width}, Height: ${Get.height}");
          return mobileLarge ?? mobile!;
        } else {
          _showLog("MOBILE => Width: ${Get.width}, Height: ${Get.height}");
          return mobile!;
        }
      },
    );
  }

  void _showLog(dynamic message) {
    // if (showDeviceLogs) log.i(message);
  }

  static Responsive testResponsiveness() {
    return Responsive(
      showDeviceLogs: true,
      mobile: Container(
        color: Colors.red,
        child: const Text('MOBILE'),
      ),
      mobileLarge: Container(
        color: Colors.blue,
        child: const Text('MOBILE LARGE'),
      ),
      tabletSmall: Container(
        color: Colors.green,
        child: const Text('TABLET'),
      ),
      tablet: Container(
        color: Colors.yellow,
        child: const Text('TABLET SMALL'),
      ),
      desktop: Container(
        color: Colors.deepPurpleAccent,
        child: const Text('DESKTOP'),
      ),
    );
  }
}