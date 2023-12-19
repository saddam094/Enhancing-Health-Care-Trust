import 'package:enhancing_healthcare_trust/start/home_page.dart';
import 'package:get/get.dart';

class AllData extends GetxController{
  RxInt selected = 0.obs;

  RxString Token = "".obs;

  void updateToken(String token){
    Token = token.obs;
    update();
  }
  Rx<RxString> getToken(){
    return Token.obs;
  }

  void changeSelected (int value){
    selected.value = value;
    update();
    //print(selected.value);
  }

  RxInt selectedBottom = 0.obs;

  void changeSelectedBottomBar (int value){
    selectedBottom.value = value;
    update();
  }

}

//Doctor Data ==================================================================
class DoctorData extends GetxController{
  RxList<String> doctorName = ["John Wilson","Alexa Johnson","Tim Smith", "Wade Warren","Leslie Alexander","Jacob Jones","Sarfraz Alam","Sammi Akhtar","Sonam Gupta"].obs;
  RxList<String> doctorDepartment = ["Cardiology","Heart Sergon","Microbiologist","Hematologist","Endocrinologists","Physoteriphist","Eye Specialist","Skin Specialist","Neuro Sergon"].obs;
  RxList<String> doctorDistance = ["1.0km away","1.8km away","800m away","2.0km away","3.0km away","3.2km away","1.5km away","500m away","2.3km away"].obs;
  RxList<String> doctorRating = ["4.8", "4.5", "4.8", "4.2", "4.5", "4.5", "4.9", "4.3", "3.5"].obs;
  RxList<String> doctorImagePath = [
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg',
    'assets/images/doctor_image/doctorImage.jpg'].obs;

}


// Services Data ===============================================================
class ServicesData extends GetxController{
  RxList<String> serviceType = ["Doctor", "Nurse", "Drug", "Caregiver"].obs;
  RxList<String> serviceTypeImagePath = [
    "assets/images/services_image/Doctor.jpg",
    "assets/images/doctor_image/doctorImage.jpg",
    "assets/images/doctor_image/doctorImage.jpg",
    "assets/images/doctor_image/doctorImage.jpg"].obs;

}


// User data ===================================================================
class UserData extends GetxController{
  RxString output = ''.obs;
  RxString emailOut = ''.obs;
  RxString passwordOut = ''.obs;
  RxList<String> userEmail = [""].obs;
  RxList<String> userPass = [""].obs;

  void login(String email,password){
    for(int a=0; a<userEmail.length; a++){
      if(email == userEmail[a]) {
        if(password == userPass[a]){
          Get.to(HomePage());
        }
        passwordOut = 'incorrect password'.obs;
        update();
      }
    }
    emailOut = 'email does not exist'.obs;
    update();
  }

  void signUp(String email,password){
    for(int a=0; a<userEmail.length; a++){
      if(email == userEmail[a]) {
        output = 'email already exist'.obs;
        update();
      }
    }
    userEmail.add(email);
    userPass.add(password);
    Get.to(HomePage());
  }
}