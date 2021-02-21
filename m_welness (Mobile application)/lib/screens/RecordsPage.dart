import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:m_welness/constants.dart';
import 'package:m_welness/services/apiService.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
ApiService apiService = ApiService();

class RecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        child: FutureBuilder(
          future: apiService.getPost('Normal'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _firebaseFirestore
                  .collection(FirebaseAuth.instance.currentUser.uid)
                  .add(snapshot.data);
              Map snap = snapshot.data;
              return GridView.count(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 40),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['steps'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.shoePrints,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Steps',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['heartRate'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.heartbeat,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Rate',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['bloodPressure'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  MdiIcons.bloodBag,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['bodyTemperature'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  snap['bodyTemperature'] > 40
                                      ? FontAwesomeIcons.temperatureHigh
                                      : MdiIcons.temperatureCelsius,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Temp',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['cholesterol'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  MdiIcons.water,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    'Cholesterol',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'LinotteBold',
                                        fontSize: 40,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['glucose'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  MdiIcons.spoonSugar,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Glucose',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['oxygenSaturation'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  MdiIcons.cloud,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Oxygen',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      color: kSecondaryColor,
                      shadowColor: kSecondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snap['respiration'].toString(),
                              style: TextStyle(
                                  fontFamily: 'LinotteBold',
                                  fontSize: 65,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.lungs,
                                  size: 35,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Breathe',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 40,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]);
            }
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
            ));
          },
        ));
  }
}
