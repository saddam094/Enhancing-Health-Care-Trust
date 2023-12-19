import 'dart:convert';
import 'package:enhancing_healthcare_trust/all_data.dart';
import 'package:enhancing_healthcare_trust/start/home_page.dart';
import 'package:enhancing_healthcare_trust/start/signup_page.dart';
import 'package:enhancing_healthcare_trust/start/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  static const String KEYTOKEN= "Token";
  final LoginData controller = Get.put(LoginData());
  final AllData controller1 = Get.put(AllData());
  //List<LoginModel> user = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static var Token;

  void login(String email,password) async{

    var userData = {
      'email': email,
      'password': password
    };
    final jsonData = json.encode(userData);
    var response;
    try{
      response = await http.post(
        Uri.parse('https://nc47u17uka.execute-api.ap-south-1.amazonaws.com/demo/login'),
        body: jsonData
      );
      var newResponse = jsonDecode(response.body);
      storeToken(newResponse['body-json']['token']);
      if(response.statusCode == 200){
        if(newResponse['body-json']['statusCode'] == 200){
          controller1.updateToken(newResponse['body-json']['token']);
          controller.putLoginemail(email);
          controller.normalState();
          var sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
          //Get.off(() => HomePage());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Login Successfully!',
          );
          //print(newResponse['body-json']['body']);
        }else if(newResponse['body-json']['statusCode'] == 400){
          controller.updateError(newResponse['body-json']['body']);
        }
      }else{
        print('Failed');
      }

    }catch(e){
      print('wrong jiiiiiiiiiiiii');
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              //color: Colors.lightBlueAccent,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topCenter,
                //stops: [0.2,0.5],
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200), bottomRight: Radius.circular(200)),
            ),
            child: Center(child: Icon(Icons.health_and_safety_outlined, size: 200,color: Colors.grey.shade300,)),
          ),
          Container(
            padding: EdgeInsets.only(top: 200, left: 10, right: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined, size: 30, color: Colors.lightBlueAccent,)
                  ),
                ),
                Container(
                  height: 40,
                ),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password, size: 30, color: Colors.lightBlueAccent,)
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  child: Obx(() => Text(controller.error.toString(), style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent),)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      login(emailController.text.toString(), passwordController.text.toString());
                      //Get.to(HomePage());
                    },
                        child: Center(child: Text('Login', style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),))
                    ),
                    ElevatedButton(onPressed: (){
                      Get.to(SignUpPage());
                    },
                        child: Center(child: Text('Sign Up', style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),))
                    ),
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  void storeToken(newResponse) async{
    //print(newResponse);
    var pref = await SharedPreferences.getInstance();
    pref.setString(KEYTOKEN, newResponse);
  }
}

class LoginData extends GetxController{
  var loginemail;

  void putLoginemail(dynamic value){
    loginemail = value;
  }
  RxString error = ''.obs;
  void updateError(String errorvalue){
    error = errorvalue.obs;
    update();
  }

  void normalState(){
    error = ''.obs;
    update();
  }
}