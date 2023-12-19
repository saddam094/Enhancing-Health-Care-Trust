
import 'package:enhancing_healthcare_trust/all_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularDoctor extends StatefulWidget {
  const PopularDoctor({super.key});

  @override
  State<PopularDoctor> createState() => _PopularDoctorState();
}

class _PopularDoctorState extends State<PopularDoctor> {
  final DoctorData doctorController = Get.put(DoctorData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Popular Doctor'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        //color: Colors.yellowAccent,
        child: ListView.builder(
          itemCount: doctorController.doctorName.length,
          itemBuilder: (context, index) {
              return Card(
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
              );
            },
        ),
      ),
    );
  }
}
