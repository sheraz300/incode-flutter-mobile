import 'package:get/get.dart';
import 'network_controller.dart';

class DependencyInjection {
  static void initi() async{
  
    Get.put<InternetCheckingController>(InternetCheckingController(),permanent:true); 
   
  }
}