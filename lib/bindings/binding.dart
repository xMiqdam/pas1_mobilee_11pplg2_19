import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/controller/dashboard_controller.dart';



class MyBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardController());
  }
}