
import 'package:get/get.dart';

class CustomerData extends GetxController{
  RxString cname = ''.obs;
  RxString cbirthday = ''.obs;
  RxString cmobile = ''.obs;
  RxString cemail = ''.obs;

  void updateProfile (RxString name,birth,mobile,email){
    cname = name;
    cbirthday = birth;
    cmobile = mobile;
    cemail = email;
    update();
  }
}