import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_welness/constants.dart';
import 'package:m_welness/widgets/AuthenticationForm.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kPrimaryColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome,',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LinotteBold',
                    fontSize: 80),
              ),
              SizedBox(
                height: 35,
              ),
              AuthenticationForm(
                screenHeight: height,
                screenWidth: width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
