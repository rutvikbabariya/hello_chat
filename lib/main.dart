import 'package:flutter/material.dart';
import 'package:hello_chat/helper/authenticate.dart';
import 'package:hello_chat/helper/helperfunctions.dart';
import 'package:hello_chat/views/chatRoomScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

  bool userIsLoggedIn = false;
class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }
  
  getLoggedInState() async{
    await HelperFunctions.getUserLoggedINSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn ? ChatRoom() : Authenticate() ,
    );
  }
}


