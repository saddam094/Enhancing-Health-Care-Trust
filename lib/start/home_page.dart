import 'package:enhancing_healthcare_trust/all_data.dart';
import 'package:enhancing_healthcare_trust/bottom_bar/different_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AllData controller = Get.put(AllData());

  var pageData = [HomeScreen(), AppointmentScreen(), ChatScreen(), MyProfileScreen()];
  @override
  Widget build(BuildContext context) {
    //print('build');
    return Scaffold(
      body: GetBuilder<AllData>(
        builder: (newController) =>
            Stack(
              children: [
                Container(
                  height: 600,
                  color: Colors.grey.shade200,
                ),
                pageData[controller.selectedBottom.value],
              ],
            ),
      ),
      bottomNavigationBar: GetBuilder<AllData>(
        builder: (newController) =>
            BottomNavigationBar(
              backgroundColor: Colors.lightBlueAccent,
              iconSize: 40,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Apointment',),
                BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Chat'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Profile'),
              ],
              currentIndex: controller.selectedBottom.value,
              onTap: (setValue){
                controller.changeSelectedBottomBar(setValue);
              },
            ),
      )
        );
  }
}
