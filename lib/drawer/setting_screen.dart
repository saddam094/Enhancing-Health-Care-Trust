import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final Data controller = Get.put(Data());
  bool statusNotification = false;
  //bool status1  = false;

  void result(){
    if(controller.statusDarkMode.value){
      Get.changeTheme(ThemeData.light());
    }else{
      Get.changeTheme(ThemeData.dark());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, left: 30, right: 20, bottom: 20),
            height: Get.height * .35,
            width: Get.width * 1,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, size: 30,color: Colors.white,),
                    SizedBox(width: 10),
                    Text('Settings', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
                  ],
                ),
              ],
            )
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: Get.height * .15),
                Container(
                  height: Get.height * .85,
                  width: Get.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Account setting', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Edit profile', style: TextStyle(fontSize: 20)),
                            Icon(Icons.arrow_forward_ios, size: 18,)
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Change password', style: TextStyle(fontSize: 20)),
                            Icon(Icons.arrow_forward_ios, size: 18,)
                          ],
                        ),
                        SizedBox(height: 20),
                        new Divider(thickness: 1),
                        SizedBox(height: 20),
                        Text('Payment setting', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Add payment method', style: TextStyle(fontSize: 20)),
                            Icon(Icons.arrow_forward_ios, size: 18,)
                          ],
                        ),
                        SizedBox(height: 20),
                        new Divider(thickness: 1),
                        SizedBox(height: 20),
                        Text('Permission setting', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Notification', style: TextStyle(fontSize: 20)),
                            FlutterSwitch(
                              activeColor: Colors.green,
                              width: 60.0,
                              height: 25.0,
                              valueFontSize: 15.0,
                              toggleSize: 20.0,
                              value: statusNotification,
                              borderRadius: 30.0,
                              padding: 5.0,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  statusNotification = val;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        new Divider(thickness: 1),
                        SizedBox(height: 20),
                        Text('Theme setting', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Dark mode', style: TextStyle(fontSize: 20)),
                            FlutterSwitch(
                                activeColor: Colors.green,
                                width: 60.0,
                                height: 25.0,
                                valueFontSize: 15.0,
                                toggleSize: 20.0,
                                value: controller.statusDarkMode.value,
                                borderRadius: 30.0,
                                padding: 5.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  result();
                                  controller.updateStatus(val);
                                  setState(() {});
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}


class Data extends GetxController{
  RxBool statusDarkMode = false.obs;

  void updateStatus (bool value){
    statusDarkMode = value.obs;
    update();
  }
}