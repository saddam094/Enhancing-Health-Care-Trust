
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Page'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(''),
              )
            ),
          ),
        ],
      )
    );
  }
}

getFromGalary() async{
  try{
    XFile? PickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
  }catch(e){
    print(e.toString());
  }
}