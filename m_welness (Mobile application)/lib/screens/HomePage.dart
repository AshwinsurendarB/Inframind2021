import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m_welness/constants.dart';
import 'package:m_welness/screens/AuthenticationPage.dart';
import 'package:m_welness/screens/ProfilePage.dart';
import 'package:m_welness/screens/RecordsPage.dart';
import 'package:m_welness/screens/chatBot.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: kSecondaryColor,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent, // status bar color
    ));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kSecondaryColor,
            title: Text('Health Track',
                style: TextStyle(
                    fontFamily: 'LinotteBold',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor)),
            elevation: 5,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => AuthPage()),
                            (route) => false));
                  },
                  color: kPrimaryColor,
                ),
              )
            ],
            shadowColor: kSecondaryColor,
          ),
          floatingActionButton: currentIndex == 0
              ? FloatingActionButton(
                  onPressed: () {
                    return showDialog(
                      context: context,
                      useSafeArea: true,
                      builder: (context) => Dialog(
                        insetPadding: EdgeInsets.all(10),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 20),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Steps',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Heart Rate',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Blood Pressure',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Temperature',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Cholesterol',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Glucose',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Oxygen Saturation',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    cursorColor: kSecondaryColor,
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: 'LinotteBold',
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                      hintText: 'Respiration',
                                      hintStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: 'LinotteBold',
                                          fontSize: 25),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: kSecondaryColor,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kSecondaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: kSecondaryColor, width: 3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        kSecondaryColor),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                padding: MaterialStateProperty.all<
                                                        EdgeInsets>(
                                                    EdgeInsets.symmetric(vertical: 15))),
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection(FirebaseAuth
                                                      .instance.currentUser.uid)
                                                  .add({});
                                            },
                                            child: Text(
                                              'Save',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: kPrimaryColor,
                                                  fontFamily: 'LinotteBold'),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.red[400]),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                padding: MaterialStateProperty.all<EdgeInsets>(
                                                    EdgeInsets.symmetric(vertical: 15))),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Dismiss',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: kPrimaryColor,
                                                  fontFamily: 'LinotteBold'),
                                            )),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  // backgroundColor: Color(0xFF28ffff),
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    FontAwesomeIcons.stickyNote,
                    color: kSecondaryColor,
                    size: 30,
                  ),
                  elevation: 5,
                )
              : null,
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.black, blurRadius: 5),
              ],
            ),
            child: BottomNavigationBar(
              iconSize: 28,
              currentIndex: currentIndex,
              elevation: 3,
              selectedFontSize: 18,
              unselectedFontSize: 18,
              backgroundColor: kSecondaryColor,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey[300],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.medical_services_rounded),
                    label: "Records"),
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.robot), label: "Chatbot"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_rounded), label: "Profile"),
              ],
            ),
          ),
          body: navItems[currentIndex]),
    );
  }
}

List<Widget> navItems = [RecordsPage(), ChatBot(), ProfilePage()];
