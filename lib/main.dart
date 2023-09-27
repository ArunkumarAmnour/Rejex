import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rejex/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: form(),
    );
  }
}

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  validate() {

    if (namecontroller.text.length <= 2) {
      Fluttertoast.showToast(msg: 'name is required');
    }
    else if (namecontroller.text.contains( RegExp(r'[0-9]'))){
      Fluttertoast.showToast(msg:"Number Not allowed Into Name");
    }
    else if(!namecontroller.text.startsWith(RegExp(r'[A-Z]'))){
      Fluttertoast.showToast(msg:"Name Must Start With Capital letter");
    }
    else if(namecontroller.text.contains(RegExp(r'[a-b]'))){
      Fluttertoast.showToast(msg:"Name Should mix of uppercase and  lowercase");
    }
    else if(!emailcontroller.text.startsWith(RegExp(r'[a-z]'))){
      Fluttertoast.showToast(msg:"Email Should Start With small letter");
    }
    else if (!emailcontroller.text.contains("@gmail.com")){
        Fluttertoast.showToast(msg:"Please enter email");
    }

    // else if( passwordcontroller.text.length<=8){
    //        Fluttertoast.showToast(msg: "required");
    // }

    else {
      Fluttertoast.showToast(msg:"successs");
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home(),));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("REJEX",style: TextStyle(fontSize: 30),),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                  label: Text('Name'), border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  label: Text('Email'), border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 300),
              ),
              onPressed: () {
                validate();


              }, child: Text("REGEX")),
        ],
      ),
    );
  }}








