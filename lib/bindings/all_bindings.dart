import 'package:get/instance_manager.dart';
import 'package:incode/controllers/login_controller.dart';
import 'package:incode/controllers/registeration_controller.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterationController());
  }
}
