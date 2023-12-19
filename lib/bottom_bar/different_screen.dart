
import 'package:enhancing_healthcare_trust/all_data.dart';
import 'package:enhancing_healthcare_trust/bottom_bar/popular_doctor.dart';
import 'package:enhancing_healthcare_trust/drawer/address_screen.dart';
import 'package:enhancing_healthcare_trust/drawer/setting_screen.dart';
import 'package:enhancing_healthcare_trust/screen/doctor_detail.dart';
import 'package:enhancing_healthcare_trust/start/login_page.dart';
import 'package:enhancing_healthcare_trust/start/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/chat_model.dart';
import '../widgets/conversation_list.dart';



// Home Screen =================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AllData controller = Get.put(AllData());
  final DoctorData doctorController = Get.put(DoctorData());
  final ServicesData servicesController = Get.put(ServicesData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashbord'),
        backgroundColor: Colors.lightBlueAccent,

      ),
      drawer: GetBuilder<AllData>(
        builder: (newController) =>
            Drawer(
              backgroundColor: Colors.lightBlueAccent.shade400,
              child: ListView(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                          ),
                          Text('Saddam Hussain', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text('saddam717860@gmail.com', style: TextStyle(fontSize: 18, backgroundColor: Colors.grey),)
                        ],
                      )
                  ),
                  ListTile(
                    selected: controller.selected.value == 1,
                    leading: Icon(Icons.book_online,size: 25),
                    title: Text('My Bookin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: (){
                      controller.changeSelected(1);
                    },
                  ),
                  ListTile(
                    selected: controller.selected.value == 2,
                    leading: Icon(Icons.shopping_cart,size: 25),
                    title: Text('My Order', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: (){
                      controller.changeSelected(2);
                    },
                  ),
                  ListTile(
                    selected: controller.selected.value == 3,
                    leading: Icon(Icons.location_on,size: 25),
                    title: Text('My Addres', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: (){
                      controller.changeSelected(3);
                      Get.to(LocationPage());
                    },
                  ),
                  new Divider(
                    thickness: 3,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    selected: controller.selected.value == 4,
                    leading: Icon(Icons.settings,size: 25),
                    title: Text('Setting', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: (){
                      controller.changeSelected(4);
                      Get.to(SettingScreen());
                    },
                  ),
                  ListTile(
                    selected: controller.selected.value == 5,
                    leading: Icon(Icons.help_center,size: 25),
                    title: Text('Help & Support', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: (){
                      controller.changeSelected(5);
                    },
                  ),
                  new Divider(
                    thickness: 3,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    selected: controller.selected.value == 6,
                    title: Text('Privacy Policy', style: TextStyle(fontSize: 20)),
                    onTap: (){
                      controller.changeSelected(6);
                    },
                  ),
                  ListTile(
                    selected: controller.selected.value == 7,
                    title: Text('Terms & Condition', style: TextStyle(fontSize: 20)),
                    onTap: (){
                      controller.changeSelected(7);
                    },
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    selected: controller.selected.value == 8,
                    leading: Icon(Icons.logout, size: 25),
                    title: Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: (){
                      controller.changeSelected(8);
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        text: 'Do you want to logout',
                        confirmBtnText: 'Yes',
                        onConfirmBtnTap: () async{
                          var sharedPref = await SharedPreferences.getInstance();
                          sharedPref.setBool(SplashScreenState.KEYLOGIN, false);
                          Get.offAll(LoginPage());
                        },
                        cancelBtnText: 'No',
                        confirmBtnColor: Colors.green,
                      );
                    },
                  )
                ],
              ),

            ),
      ),
      body: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search',
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                suffixIcon: Icon(Icons.search, size: 30,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.notifications, size: 40,))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Service Category', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        TextButton(onPressed: (){},
                            child: Text('See All', style: TextStyle(fontSize: 20, color: Colors.blue),)
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                  //borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(width: 1, color: Colors.black),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(servicesController.serviceTypeImagePath[index]),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 2, color: Colors.black),

                                      ),

                                    ),
                                    Text(servicesController.serviceType[index].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Popular Doctors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        TextButton(onPressed: (){
                          Get.to(PopularDoctor());
                        },
                            child: Text('See All', style: TextStyle(fontSize: 20, color: Colors.blue),)
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                    height: 300,
                    child:  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(width: 1, color: Colors.black),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(doctorController.doctorImagePath[index]),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_rate_rounded, size:  30, color: Colors.yellowAccent,),
                                          Text(' 4.8', style: TextStyle(fontSize: 20))
                                        ],
                                      ),
                                      Text('John Wilson', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      Text('Cardiology', style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],

              ),
            ],
          )
      ),
    );
  }
}


// Appointment Screen ==========================================================
class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final DoctorData doctorController = Get.put(DoctorData());


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctorController.doctorName.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Get.to(DoctorDetail());
          },
          child: Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 120,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(doctorController.doctorImagePath[index]),
                        fit: BoxFit.cover,
                      ),
                      //color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctorController.doctorName[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(doctorController.doctorDepartment[index], style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 25),
                            Text(doctorController.doctorDistance[index], style: TextStyle(fontSize: 18))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded, size: 30, color: Colors.yellowAccent),
                          SizedBox(width: 3),
                          Text(doctorController.doctorRating[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



// Chat Screen =================================================================
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatUsers> chatUsers = [
  ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "Now"),
  ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "Yesterday"),
  ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "31 Mar"),
  ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "28 Mar"),
  ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "23 Mar"),
  ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "17 Mar"),
  ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "24 Feb"),
  ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "assets/images/doctor_image/doctorImage.jpg", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}




// My Profile Screen ===========================================================
class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? myToken;
  Map<String, dynamic> decodeToken = JwtDecoder.decode('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiY2siLCJlbWFpbCI6ImNrNTEyQGdtYWlsLmNvbSIsImRvYiI6IjEyLzA4LzIwMjMiLCJwaG9uZSI6Ijk4ODQwMzk0OTMiLCJwcm9maWxlSW1hZ2UiOiJodHRwczovL3Rpcy13aGF0c2FwcC1iLWRlbW8uczMuYXAtc291dGgtMS5hbWF6b25hd3MuY29tL3Rpcy13aGF0c2FwcC1iLWRlbW8vaW1hZ2UvY2suanBnIiwiaWF0IjoxNzAyOTU3OTUzfQ.-bWjHqO05PGjyWjxRWOEjK6Dergn2Qt4TztUO4ak87o');
  //Map<String, dynamic> decodeToken = JwtDecoder.decode('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoibWQgc2FyZnJheiBBbGFtIiwiZW1haWwiOiJzYXJmcmF6NzE3ODYwQGdtYWlsLmNvbSIsInBob25lIjoiOTY5MzcyNDUyMCIsImlhdCI6MTcwMjM2ODcyN30.IREhRKFtWtgnW22Hkh8aBnryjrtMQdG1lxv7oVEhQuQ');

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
        ),
        Container(
          height: Get.height * .45,
          width: Get.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/doctor_image/doctorImage.jpg'),
              fit: BoxFit.cover,
            )
          ),
        ),
        Column(
          children: [
            SizedBox(height: Get.height * .4),
            Container(
              padding: EdgeInsets.only(top: 120, left: 20),
              height: Get.height * .45,
              width: Get.width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                  )
                ]
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 30),
                      SizedBox(width: 20),
                      Text(decodeToken['name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: Get.height * .02),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 30),
                      SizedBox(width: 20),
                      Text(decodeToken['dob'] == null ? "----------" : decodeToken['dob'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: Get.height * .02),
                  Row(
                    children: [
                      Icon(Icons.phone_android, size: 30),
                      SizedBox(width: 20),
                      Text(decodeToken['phone'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: Get.height * .02),
                  Row(
                    children: [
                      Icon(Icons.email_outlined, size: 30),
                      SizedBox(width: 20),
                      Text(decodeToken['email'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 2,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: Get.height * .3),
            Container(
              height: Get.height * .2,
              width:  Get.width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('assets/images/doctor_image/doctorImage.jpg'),
                  fit:  BoxFit.cover,
                ),
                color:  Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                  )
                ]
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: Get.height * .15),
            IconButton(onPressed: (){},
            icon: Icon(Icons.photo_camera_outlined, size: 40)),
          ],
        )
      ],
    );
  }
  void passToken () async{
    var pref = await SharedPreferences.getInstance();
    myToken = pref.getString(LoginPageState.KEYTOKEN);
  }
}
