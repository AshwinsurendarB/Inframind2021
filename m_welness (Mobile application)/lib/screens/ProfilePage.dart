import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:m_welness/constants.dart';

User user = FirebaseAuth.instance.currentUser;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String valueDropDown, age;
  bool state = false;

  TextEditingController nameController;
  TextEditingController ageController;

  @override
  void initState() {
    nameController = TextEditingController(
        text: user.displayName != null ? user.displayName : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseFirestore
            .collection(user.uid)
            .doc('userData')
            .get()
            .then((value) {
          ageController = TextEditingController(
              text: value.get('age') != null ? value.get('age') : null);
          valueDropDown =
              value.get('gender') != null ? value.get('gender') : null;
          return {
            'age': value.get('age') != null ? value.get('age') : null,
            'valuedropDown':
                value.get('gender') != null ? value.get('age') : null
          };
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.vexels.com/media/users//3/145908/raw/52eabf633ca6414e60a7677b0b917d92.jpg'),
                        radius: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            border:
                                Border.all(color: kSecondaryColor, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  blurRadius: 3,
                                  spreadRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          disabledColor: kSecondaryColor,
                          color: kSecondaryColor,
                          onPressed: () {
                            setState(() {
                              state = !state;
                            });
                            showFlash(
                              duration: Duration(seconds: 1, milliseconds: 500),
                              context: context,
                              builder: (context, controller) {
                                return Flash(
                                    onTap: () => controller.dismiss(),
                                    controller: controller,
                                    backgroundColor: kPrimaryColor,
                                    child: FlashBar(
                                      leftBarIndicatorColor: kSecondaryColor,
                                      message: state
                                          ? Text(
                                              'You can edit your details',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: kSecondaryColor,
                                                  fontFamily: 'LinotteBold'),
                                            )
                                          : Text(
                                              'You cannot edit your details',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: kSecondaryColor,
                                                  fontFamily: 'LinotteBold'),
                                            ),
                                      title: state
                                          ? Text(
                                              'Editing Enabled',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: kSecondaryColor,
                                                  fontFamily: 'LinotteBold'),
                                            )
                                          : Text(
                                              'Editing Disabled',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: kSecondaryColor,
                                                  fontFamily: 'LinotteBold'),
                                            ),
                                      icon: state
                                          ? Icon(
                                              MdiIcons.checkBold,
                                              color: kSecondaryColor,
                                            )
                                          : Icon(
                                              Icons.warning,
                                              color: kSecondaryColor,
                                            ),
                                    ));
                              },
                            );
                          },
                          icon: Icon(
                            MdiIcons.pencil,
                            color: kSecondaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    enabled: state,
                    controller: nameController,
                    cursorColor: kSecondaryColor,
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontFamily: 'LinotteBold',
                        fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                          color: kSecondaryColor,
                          fontFamily: 'LinotteBold',
                          fontSize: 25),
                      prefixIcon: Icon(
                        FontAwesomeIcons.user,
                        color: kSecondaryColor,
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kSecondaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kSecondaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kSecondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    enabled: state,
                    controller: ageController,
                    cursorColor: kSecondaryColor,
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontFamily: 'LinotteBold',
                        fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Age',
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
                        borderSide: BorderSide(color: kSecondaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kSecondaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kSecondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: kSecondaryColor, width: 3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  DropdownButtonFormField(
                      value: valueDropDown ?? null,
                      onChanged: state
                          ? (value) {
                              valueDropDown = value;
                            }
                          : null,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: kSecondaryColor,
                            fontFamily: 'LinotteBold',
                            fontSize: 25),
                        prefixIcon: Icon(
                          MdiIcons.genderMaleFemaleVariant,
                          color: kSecondaryColor,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kSecondaryColor),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kSecondaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kSecondaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: kSecondaryColor, width: 3),
                        ),
                      ),
                      iconEnabledColor: kSecondaryColor,
                      iconDisabledColor: kSecondaryColor,
                      hint: Text(
                        'Gender',
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontFamily: 'LinotteBold',
                            fontSize: 25),
                      ),
                      dropdownColor: kPrimaryColor,
                      items: ["Male", 'Female', 'Other', 'Rather Not Say']
                          .map((label) => DropdownMenuItem(
                                child: Text(
                                  label.toString(),
                                  style: TextStyle(
                                      color: kSecondaryColor,
                                      fontFamily: 'LinotteBold',
                                      fontSize: 25),
                                ),
                                value: label,
                              ))
                          .toList()),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: state
                            ? () {
                                if (nameController.text.isNotEmpty) {
                                  user
                                      .updateProfile(
                                          displayName: nameController.text,
                                          photoURL: null)
                                      .then((value) {
                                    setState(() {});
                                  });
                                }
                                if (ageController.text.isNotEmpty &&
                                    valueDropDown.isNotEmpty) {
                                  _firebaseFirestore
                                      .collection(user.uid)
                                      .doc('userData')
                                      .set({
                                    'age': ageController.text,
                                    'gender': valueDropDown
                                  }).then((value) => showFlash(
                                            duration: Duration(
                                                seconds: 1, milliseconds: 500),
                                            context: context,
                                            builder: (context, controller) {
                                              return Flash(
                                                  onTap: () =>
                                                      controller.dismiss(),
                                                  controller: controller,
                                                  backgroundColor:
                                                      kPrimaryColor,
                                                  child: FlashBar(
                                                      leftBarIndicatorColor:
                                                          kSecondaryColor,
                                                      message: Text(
                                                        'Details has been successfully updated',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                kSecondaryColor,
                                                            fontFamily:
                                                                'LinotteBold'),
                                                      ),
                                                      title: Text(
                                                        'Update Successful',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color:
                                                                kSecondaryColor,
                                                            fontFamily:
                                                                'LinotteBold'),
                                                      ),
                                                      icon: Icon(
                                                        MdiIcons.checkBold,
                                                        color: kSecondaryColor,
                                                      )));
                                            },
                                          ));
                                } else if (ageController.text.isNotEmpty) {
                                  _firebaseFirestore
                                      .collection(user.uid)
                                      .doc('userData')
                                      .set({'age': ageController.text}).then(
                                          (value) => showFlash(
                                                duration: Duration(
                                                    seconds: 1,
                                                    milliseconds: 500),
                                                context: context,
                                                builder: (context, controller) {
                                                  return Flash(
                                                      onTap: () =>
                                                          controller.dismiss(),
                                                      controller: controller,
                                                      backgroundColor:
                                                          kPrimaryColor,
                                                      child: FlashBar(
                                                          leftBarIndicatorColor:
                                                              kSecondaryColor,
                                                          message: Text(
                                                            'Details has been successfully updated',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    kSecondaryColor,
                                                                fontFamily:
                                                                    'LinotteBold'),
                                                          ),
                                                          title: Text(
                                                            'Update Successful',
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                color:
                                                                    kSecondaryColor,
                                                                fontFamily:
                                                                    'LinotteBold'),
                                                          ),
                                                          icon: Icon(
                                                            MdiIcons.checkBold,
                                                            color:
                                                                kSecondaryColor,
                                                          )));
                                                },
                                              ));
                                } else if (valueDropDown.isNotEmpty) {
                                  _firebaseFirestore
                                      .collection(user.uid)
                                      .doc('userData')
                                      .set({'gender': valueDropDown}).then(
                                          (value) => showFlash(
                                                duration: Duration(
                                                    seconds: 1,
                                                    milliseconds: 500),
                                                context: context,
                                                builder: (context, controller) {
                                                  return Flash(
                                                      onTap: () =>
                                                          controller.dismiss(),
                                                      controller: controller,
                                                      backgroundColor:
                                                          kPrimaryColor,
                                                      child: FlashBar(
                                                          leftBarIndicatorColor:
                                                              kSecondaryColor,
                                                          message: Text(
                                                            'Details has been successfully updated',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    kSecondaryColor,
                                                                fontFamily:
                                                                    'LinotteBold'),
                                                          ),
                                                          title: Text(
                                                            'Update Successful',
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                color:
                                                                    kSecondaryColor,
                                                                fontFamily:
                                                                    'LinotteBold'),
                                                          ),
                                                          icon: Icon(
                                                            MdiIcons.checkBold,
                                                            color:
                                                                kSecondaryColor,
                                                          )));
                                                },
                                              ));
                                }
                                setState(() {
                                  state = !state;
                                });
                              }
                            : null,
                        style: ButtonStyle(
                            shadowColor: state
                                ? MaterialStateProperty.all<Color>(
                                    kSecondaryColor)
                                : MaterialStateProperty.all<Color>(
                                    Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: state
                                ? MaterialStateProperty.all<Color>(
                                    kSecondaryColor)
                                : MaterialStateProperty.all<Color>(
                                    Colors.white)),
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: 'LinotteBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )),
                  )
                ],
              ),
            );
          }
          return Container(
            color: kPrimaryColor,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
              ),
            ),
          );
        });
  }
}
