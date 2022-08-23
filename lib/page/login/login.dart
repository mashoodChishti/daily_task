// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:another_flushbar/flushbar.dart';
import 'package:daily_task/page/home/home_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../pallette.dart';
import '../../provider/auth_provider.dart';
import '../../signUp/signup.dart';
import '../../util/auth.dart';
import '../../widgets/backgroundimage.dart';
import '../../widgets/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService(); //authservice object create
  final formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String error = '';
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    //do Login Method
    // ignore: prefer_function_declarations_over_variables
    var doLogin = () async {
      setState(() {
        auth.loggedInStatus = Status.Authenticating;
      });

      FormState? form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        dynamic result = await _auth.signinwithemailAndpassword(
            context, _email!, _password!);
        if (result != "Success") {
          setState(() {
            auth.loggedInStatus = Status.NotLoggedIn;
          });
          Flushbar(
            title: 'Loging Failed',
            message: result,
            duration: Duration(seconds: 10),
          ).show(context);
        } else {
          auth.loggedInStatus = Status.LoggedIn;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false);
        }
      } else {
        auth.loggedInStatus = Status.NotLoggedIn;
        // Flushbar(
        //   title: 'Invalid Username or Password',
        //   message: 'Please enter the correct credentials',
        //   duration: Duration(seconds: 10),
        // ).show(context);
      }
    };
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
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
                      "Welcome back",
                      style: kHeading,
                    ),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    Text(
                      "Login to your account",
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
                            borderSide: BorderSide(color: kEnabledBorderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                            value!.isEmpty ? "Password is required" : null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kEnabledBorderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: size.width * 0.7,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: 15,
                              //   width: 15,
                              //   child: Checkbox(
                              //       value: isChecked,
                              //       fillColor: MaterialStateProperty.all(
                              //           kPrimaryColor),
                              //       activeColor: kPrimaryColor,
                              //       focusColor: Colors.white,
                              //       shape: CircleBorder(),
                              //       onChanged: (value) {
                              //         setState(() {
                              //           isChecked = value!;
                              //         });
                              //       }),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     'Remember me',
                              //     style: TextStyle(
                              //         color: Colors.black, fontSize: 10),
                              //   ),
                              // ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) {
                                //       return TermsAndCondtionsView();
                                //     },
                                //   ),
                                // );
                              },
                              child: Text('Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.purple)))
                        ],
                      ),
                    ),
                    auth.loggedInStatus == Status.Authenticating
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
                                  Text("Logging in Please wait",
                                      style: TextStyle(color: Colors.black87))
                                ],
                              ),
                            ),
                          )
                        : SizedBox(
                            width: size.width * 0.7,
                            height: 50,
                            child: ElevatedButton(
                              child: Text('Login Now'),
                              onPressed: doLogin,
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor,
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  //border width and color
                                  elevation: 1, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                    Container(
                      width: size.width * 0.7,
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Row(children: <Widget>[
                        Expanded(child: Divider()),
                        Text("OR"),
                        Expanded(child: Divider()),
                      ]),
                    ),
                    Container(
                      width: size.width * 0.7,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('Create New Account'),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black38,
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
