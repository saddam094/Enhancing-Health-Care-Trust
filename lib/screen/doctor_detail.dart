import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({super.key});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  final DoctorDetail doctorController = Get.put(DoctorDetail());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/doctor_image/doctorImage.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('saddam hussain',style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Column(

              children: [
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/doctor_image/doctorImage.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text('Dr. SADDAM HUSSAIN', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.lightBlue),),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Specialist :', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),),
                    SizedBox(width: 15),
                    Text('Eye Specialist', style: TextStyle(fontSize: 20))
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Experience :', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),),
                    SizedBox(width: 15),
                    Text('10 Years', style: TextStyle(fontSize: 20),)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Hospital :', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),),
                    SizedBox(width: 15),
                    Text('Arogyam Hospital', style: TextStyle(fontSize: 20),)
                  ],
                ),
                SizedBox(height: 10),
                Text('(Near  Ambedkar chowk, hazaribagh)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 25),
                ElevatedButton(onPressed: (){},

                    child: Text('Book Appointment', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                  ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
