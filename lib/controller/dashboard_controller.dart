import 'package:get/get.dart';

class DashboardController extends GetxController{
  var selectedindex = 0.obs;


  void changeMenu (int index){
    selectedindex.value = index;
  }
}