part of 'utils.dart';

class CustomSnackBar {
  static Duration defaultDuration = const Duration(seconds: 3);

  static void success({
    String? title,
    required String message,
    Duration? duration,
  }) async {
    await closeAllSnackBars();

    Get.snackbar(
      title ?? '',
      message,
      titleText: title == null ? const SizedBox.shrink() : null,
      duration: duration ?? defaultDuration,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
      colorText: Colors.white,
      maxWidth: 600,
      backgroundColor: Colors.green,
      dismissDirection: DismissDirection.none,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static void error({
    String? title,
    required String message,
    Color? color,
    Duration? duration,
  }) async {
    await closeAllSnackBars();

    Get.snackbar(
      title ?? '',
      message,
      titleText: title == null ? const SizedBox.shrink() : null,
      duration: duration ?? defaultDuration,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
      colorText: Colors.white,
      maxWidth: 600,
      backgroundColor: color ?? Colors.redAccent,
      dismissDirection: DismissDirection.none,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  static Future<void> closeAllSnackBars() async {
    if (Get.isSnackbarOpen) {
      await Future.delayed(
        const Duration(milliseconds: 50),
        () async {
          Get.closeAllSnackbars();
          await Get.closeCurrentSnackbar();
        },
      );
    }
  }

  static get pushAllToPos => success(message: 'Push All To POS Successfully.');
}