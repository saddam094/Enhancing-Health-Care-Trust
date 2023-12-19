import 'dart:convert';

import 'package:enhancing_healthcare_trust/start/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final SignupData controller = Get.put(SignupData());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  void signup(String name, email,dob, mobile, password) async{
    var userData = {
      'name': name,
      'email': email,
      'dob' : dob,
      'phone': mobile,
      'password': password,
    };
    final jsonData = json.encode(userData);
    var response;
    try{
      response = await http.post(
        Uri.parse('https://nc47u17uka.execute-api.ap-south-1.amazonaws.com/demo/signUp'),
          body: jsonData
      );
      var newResponse = json.decode(response.body);
      //print("response: ${newResponse["body-json"]}");

      if(response.statusCode == 200){
        print('hallo1');
        if(newResponse['body-json']['statusCode'] == 200){
          print('hallo2');
          controller.normalState();
          Get.off(LoginPage());
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'SignUp Successfully!',
          );
        }else if(newResponse['body-json']['statusCode'] == 400){
          controller.updateState(newResponse['body-json']['body']);
          print(newResponse['body-json']['body']);
        }

      }else{
        print('failed');
      }

    }catch(e){
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
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200), bottomRight: Radius.circular(200)),
            ),
            child: Center(child: Icon(Icons.health_and_safety_outlined, size: 200,color: Colors.grey.shade300,)),
          ),
          ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 200, left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'Full Name',
                          prefixIcon: Icon(Icons.person, size: 30, color: Colors.lightBlueAccent,)
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined, size: 30, color: Colors.lightBlueAccent,)
                      ),
                    ),
                    Container(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(''),
                            Obx(() => Text(controller.error.toString(), style: TextStyle(fontSize: 15, color: Colors.red))),
                          ],
                        )
                    ),
                    TextField(
                      controller: dobController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'birthday',
                          prefixIcon: Icon(Icons.calendar_month, size: 30, color: Colors.lightBlueAccent,)
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Mobile no',
                          prefixIcon: Icon(Icons.phone_android, size: 30, color: Colors.lightBlueAccent,)
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password, size: 30, color: Colors.lightBlueAccent,)
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: (){
                      signup(nameController.text.toString(),emailController.text.toString(),dobController.text.toString(), mobileController.text.toString(), passwordController.text.toString());
                    },
                        child: Center(child: Text('Sign Up', style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),))
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


class SignupData extends GetxController{
  RxString error = ''.obs;

  void updateState(String value){
    error = value.obs;
    update();
  }

  void normalState (){
    error = ''.obs;
    update();
  }
}