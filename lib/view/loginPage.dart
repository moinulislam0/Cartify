import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/forget.dart';
import 'package:practice_method/view/signUp.dart';
import 'package:practice_method/view/wrapper.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  SignIn() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: pass.text);

    if (user.user != null) {
      Get.off(Wrapper());
      Get.snackbar("Login Success", "You have successfully logged in.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                    height: 350, // Increase if needed
                    width: 350,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: email,
                                  style: TextStyle(color: Colors.white),
                                  validator: ((value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your email address";
                                    }
                                    return null;
                                  }),
                                  decoration: InputDecoration(
                                      hintText: "Enter your email Address",
                                      hintStyle: TextStyle(color: Colors.white),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.white)),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: pass,
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    validator: ((value) {
                                      if (value == null || value.isEmpty) {
                                        return "password required";
                                      }
                                      return null;
                                    }),
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                        errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await SignIn();
                                          }
                                        },
                                        child: Text(
                                          "LogIn",
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        )),
                                  ),
                                ]),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => Forget());
                                  },
                                  child: Text(
                                    "Forget Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                        decorationThickness: 2),
                                  )),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => Signup());
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(color: Colors.pink),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
