import 'package:enhancing_healthcare_trust/customer_data.dart';
import 'package:enhancing_healthcare_trust/start/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final CustomerData customerData = Get.put(CustomerData());
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Profile'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
          width: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellowAccent, Colors.greenAccent],
              begin: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(75),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle( fontSize: 25),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: birthdayController,
                decoration: InputDecoration(
                  hintText: 'Birthday',
                  hintStyle: TextStyle( fontSize: 25),
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: mobileController,
                decoration: InputDecoration(
                  hintText: 'Mobile no',
                  hintStyle: TextStyle( fontSize: 25),
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle( fontSize: 25),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: (){
                customerData.updateProfile(nameController.text.toString().obs, birthdayController.text.toString(), mobileController.text.toString(), emailController.text.toString());
                Get.to(HomePage());
              },
                child: Container(
                    height: 60,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text('Submit', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)))),
              )
            ],
          ),
        ),
      ]
      ),
    );
  }
}
