// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:another_flushbar/flushbar.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../page/login/login.dart';
import '../pallette.dart';
import '../provider/auth_provider.dart';
import '../util/auth.dart';
import '../widgets/email_validator.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthService _auth = AuthService(); //authservice object created
  final formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    var isChecked = false;
    //do Login Method
    // ignore: prefer_function_declarations_over_variables
    var doSignup = () async {
      setState(() {
        auth.loggedInStatus = Status.Registering;
      });
      FormState? form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        dynamic result = await _auth.registerwithEmailAndPassword(
            context, _email!, _password!);
        if (result != "Success") {
          setState(() {
            auth.loggedInStatus = Status.NotRegistered;
          });
          Flushbar(
            title: 'Registration Failed',
            message: result,
            duration: Duration(seconds: 10),
          ).show(context);
        } else {
          setState(() {
            auth.loggedInStatus = Status.Registered;
          });
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Congratulations',
            desc: 'You have been registered',
            btnOk: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => kPrimaryColor),
                ),
              ),
            ),
          )..show();
        }
      } else {
        setState(() {
          auth.loggedInStatus = Status.NotRegistered;
        });
      }
    };
    return Scaffold(
      backgroundColor: kPagebackgroundColor,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: size.height * 0.219, //182
                ),
                Text(
                  "Welcome",
                  style: kHeading,
                ),
                SizedBox(
                  height: size.height * 0.018,
                ),
                Text(
                  "Create your account",
                  style: kHeading2,
                ),
                SizedBox(
                  height: size.height * 0.044,
                ),
                Text(
                  "Email",
                  style: kLabel,
                ),
                Container(
                  width: size.width * 0.7,
                  padding: EdgeInsets.only(top: 5, bottom: 20),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                    validator: validateEmail,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          FontAwesomeIcons.envelope,
                          size: 20,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      //hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          height: 1,
                          fontWeight: FontWeight.w300),
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      // height: 1,
                      //fontWeight: FontWeight.w300
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) => _email = value,
                  ),
                ),
                Text(
                  "Password",
                  style: kLabel,
                ),
                Container(
                  width: size.width * 0.7,
                  padding: EdgeInsets.only(top: 5),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _password = val;
                      });
                    },
                    textAlignVertical: TextAlignVertical(y: 0.5),
                    validator: (value) =>
                        value!.isEmpty ? "Please enter password" : null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          FontAwesomeIcons.lock,
                          size: 20,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      // hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        // height: 1,
                        // fontWeight: FontWeight.w300
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      // height: 1,
                      // fontWeight: FontWeight.w300
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    onSaved: (value) => _password = value,
                  ),
                ),
                Container(
                  width: size.width * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                auth.loggedInStatus == Status.Registering
                    ? SizedBox(
                        width: size.width * 0.7,
                        height: 50,
                        child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Text("Registering, Please wait",
                                  style: TextStyle(color: Colors.black87))
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        width: size.width * 0.7,
                        height: 50,
                        child: ElevatedButton(
                          child: Text('Sign Up'),
                          onPressed: doSignup,
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              //border width and color
                              elevation: 1, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                Container(
                  width: size.width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              height: 1,
                              fontWeight: FontWeight.w300),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (route) => false);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      height: 1)
                                  .copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
