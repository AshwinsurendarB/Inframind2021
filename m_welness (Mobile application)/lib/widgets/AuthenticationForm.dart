import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_welness/constants.dart';
import 'package:m_welness/screens/HomePage.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class AuthenticationForm extends StatefulWidget {
  final screenWidth, screenHeight;

  const AuthenticationForm(
      {Key key, @required this.screenWidth, @required this.screenHeight})
      : super(key: key);
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  bool _obscureText = true;
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customInputField(
            "Email Address",
            Icons.email_rounded,
            false,
            false,
            _emailTextEditingController,
            emailValidator,
          ),
          SizedBox(
            height: 30,
          ),
          customInputField(
            "Password",
            Icons.lock_rounded,
            _obscureText,
            true,
            _passwordTextEditingController,
            passwordValidator,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 65,
                  child: TextButton(
                    onPressed: () async {
                      if (_emailTextEditingController.text.isEmpty) {
                        showFlash(
                          duration: Duration(seconds: 2),
                          context: context,
                          builder: (context, controller) => Flash(
                            style: FlashStyle.grounded,
                            child: FlashBar(
                              title: Text(
                                'Error Occurred',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontFamily: 'LinotteBold'),
                              ),
                              primaryAction: TextButton(
                                onPressed: controller.dismiss,
                                child: Text(
                                  'Dismiss',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 20,
                                      color: Colors.red),
                                ),
                              ),
                              leftBarIndicatorColor: Colors.red,
                              icon: Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.red,
                              ),
                              message: Text("Email field cannot be empty",
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      color: Colors.red,
                                      fontSize: 20)),
                            ),
                            controller: controller,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            position: FlashPosition.bottom,
                            barrierColor: Colors.red,
                            onTap: () => controller.dismiss(),
                          ),
                        );
                      } else if (_passwordTextEditingController.text.isEmpty) {
                        showFlash(
                          duration: Duration(seconds: 2),
                          context: context,
                          builder: (context, controller) => Flash(
                            style: FlashStyle.grounded,
                            boxShadows: [
                              BoxShadow(blurRadius: 5, color: Colors.white)
                            ],
                            child: FlashBar(
                              title: Text(
                                'Error Occurred',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontFamily: 'LinotteBold'),
                              ),
                              primaryAction: TextButton(
                                onPressed: controller.dismiss,
                                child: Text(
                                  'Dismiss',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 20,
                                      color: Colors.red),
                                ),
                              ),
                              leftBarIndicatorColor: Colors.red,
                              icon: Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.red,
                              ),
                              message: Text("Password field cannot be empty",
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      color: Colors.red,
                                      fontSize: 20)),
                            ),
                            controller: controller,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            position: FlashPosition.bottom,
                            barrierColor: Colors.red,
                            onTap: () => controller.dismiss(),
                          ),
                        );
                      } else if (_emailTextEditingController.text.isNotEmpty &&
                          _passwordTextEditingController.text.isNotEmpty) {
                        try {
                          await _firebaseAuth
                              .signInWithEmailAndPassword(
                                  email: _emailTextEditingController.text,
                                  password: _passwordTextEditingController.text)
                              .then((value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false));
                        } catch (e) {
                          return showFlash(
                            duration: Duration(seconds: 2),
                            context: context,
                            builder: (context, controller) => Flash(
                              style: FlashStyle.grounded,
                              boxShadows: [
                                BoxShadow(blurRadius: 5, color: Colors.white)
                              ],
                              child: FlashBar(
                                title: Text(
                                  'Error Occurred',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontFamily: 'LinotteBold'),
                                ),
                                primaryAction: TextButton(
                                  onPressed: controller.dismiss,
                                  child: Text(
                                    'Dismiss',
                                    style: TextStyle(
                                        fontFamily: 'LinotteBold',
                                        fontSize: 20,
                                        color: Colors.red),
                                  ),
                                ),
                                leftBarIndicatorColor: Colors.red,
                                icon: Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.red,
                                ),
                                message: Text(e.message,
                                    style: TextStyle(
                                        fontFamily: 'LinotteBold',
                                        color: Colors.red,
                                        fontSize: 20)),
                              ),
                              controller: controller,
                              backgroundColor: Colors.white,
                              enableDrag: true,
                              position: FlashPosition.bottom,
                              barrierColor: Colors.red,
                              onTap: () => controller.dismiss(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: widget.screenWidth * 0.05,
                          fontFamily: 'LinotteBold'),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                            width: 2,
                            color: kSecondaryColor,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 65,
                  child: TextButton(
                    onPressed: () async {
                      if (_emailTextEditingController.text.isEmpty) {
                        showFlash(
                          duration: Duration(seconds: 2),
                          context: context,
                          builder: (context, controller) => Flash(
                            style: FlashStyle.grounded,
                            boxShadows: [
                              BoxShadow(blurRadius: 5, color: Colors.white)
                            ],
                            child: FlashBar(
                              title: Text(
                                'Error Occurred',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontFamily: 'LinotteBold'),
                              ),
                              primaryAction: TextButton(
                                onPressed: controller.dismiss,
                                child: Text(
                                  'Dismiss',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 20,
                                      color: Colors.red),
                                ),
                              ),
                              leftBarIndicatorColor: Colors.red,
                              icon: Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.red,
                              ),
                              message: Text("Email field cannot be empty",
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      color: Colors.red,
                                      fontSize: 20)),
                            ),
                            controller: controller,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            position: FlashPosition.bottom,
                            barrierColor: Colors.red,
                            onTap: () => controller.dismiss(),
                          ),
                        );
                      } else if (_passwordTextEditingController.text.isEmpty) {
                        showFlash(
                          duration: Duration(seconds: 2),
                          context: context,
                          builder: (context, controller) => Flash(
                            style: FlashStyle.grounded,
                            boxShadows: [
                              BoxShadow(blurRadius: 5, color: Colors.white)
                            ],
                            child: FlashBar(
                              title: Text(
                                'Error Occurred',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontFamily: 'LinotteBold'),
                              ),
                              primaryAction: TextButton(
                                onPressed: controller.dismiss,
                                child: Text(
                                  'Dismiss',
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      fontSize: 20,
                                      color: Colors.red),
                                ),
                              ),
                              leftBarIndicatorColor: Colors.red,
                              icon: Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.red,
                              ),
                              message: Text("Password field cannot be empty",
                                  style: TextStyle(
                                      fontFamily: 'LinotteBold',
                                      color: Colors.red,
                                      fontSize: 20)),
                            ),
                            controller: controller,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            position: FlashPosition.bottom,
                            barrierColor: Colors.red,
                            onTap: () => controller.dismiss(),
                          ),
                        );
                      } else if (_emailTextEditingController.text.isNotEmpty &&
                          _passwordTextEditingController.text.isNotEmpty) {
                        try {
                          await _firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: _emailTextEditingController.text,
                                  password: _passwordTextEditingController.text)
                              .then((value) => FirebaseFirestore.instance
                                  .collection(value.user.uid)
                                  .doc('userData')
                                  .set({'age': null, 'gender': null}))
                              .then((value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false));
                        } catch (e) {
                          return showFlash(
                            duration: Duration(seconds: 2),
                            context: context,
                            builder: (context, controller) => Flash(
                              style: FlashStyle.grounded,
                              boxShadows: [
                                BoxShadow(blurRadius: 5, color: Colors.white)
                              ],
                              child: FlashBar(
                                title: Text(
                                  'Error Occurred',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontFamily: 'LinotteBold'),
                                ),
                                primaryAction: TextButton(
                                  onPressed: controller.dismiss,
                                  child: Text(
                                    'Dismiss',
                                    style: TextStyle(
                                        fontFamily: 'LinotteBold',
                                        fontSize: 20,
                                        color: Colors.red),
                                  ),
                                ),
                                leftBarIndicatorColor: Colors.red,
                                icon: Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.red,
                                ),
                                message: Text(e.message,
                                    style: TextStyle(
                                        fontFamily: 'LinotteBold',
                                        color: Colors.red,
                                        fontSize: 20)),
                              ),
                              controller: controller,
                              backgroundColor: Colors.white,
                              enableDrag: true,
                              position: FlashPosition.bottom,
                              barrierColor: Colors.red,
                              onTap: () => controller.dismiss(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: widget.screenWidth * 0.05,
                          fontFamily: 'LinotteBold'),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                            width: 2,
                            color: kSecondaryColor,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  TextFormField customInputField(
      hintText, icon, obscureText, visibility, controller, validator) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      cursorColor: kSecondaryColor,
      style: TextStyle(
          fontSize: widget.screenWidth * 0.05,
          color: kSecondaryColor,
          fontFamily: "LinotteBold"),
      decoration: InputDecoration(
          errorStyle: TextStyle(
              color: Colors.red,
              fontSize: widget.screenWidth * 0.035,
              fontFamily: "LinotteBold"),
          hintText: hintText,
          hintStyle: TextStyle(
              color: kSecondaryColor,
              fontSize: widget.screenWidth * 0.06,
              fontFamily: "LinotteBold"),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor, width: 3),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor, width: 3),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor, width: 3),
              borderRadius: BorderRadius.circular(15)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(15)),
          prefixIcon: Icon(
            icon,
            color: kSecondaryColor,
          ),
          suffixIcon: visibility
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: obscureText
                      ? Icon(
                          Icons.visibility,
                          color: kSecondaryColor,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: kSecondaryColor,
                        ),
                )
              : null),
    );
  }
}

String passwordValidator(String password) {
  RegExp passwordRegex = RegExp(r'''^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$''');
  if (password.contains(RegExp(r'''[^\w\*]'''))) {
    return "Cannot contain special characters";
  } else if (!passwordRegex.hasMatch(password)) {
    return "Must be 8 character long and contain one number and letter";
  }
  return null;
}

String emailValidator(String email) {
  RegExp emailRegex = RegExp(
      r'''^^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+''');
  if (!emailRegex.hasMatch(email)) {
    return "Enter a valid email";
  }
  return null;
}
