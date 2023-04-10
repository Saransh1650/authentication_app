import 'dart:developer';

import 'package:authentication_app/HomePage.dart';
import 'package:authentication_app/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  // text controller

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void signIn() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    if (email == "" || password == "") {
      log("please enter the values");
    } else {
      try {
        UserCredential userCredentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredentials != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => HomePage(),
              ));
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                //hello again text
                const Text(
                  "Hello Again !!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),

                //email textfield
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ),
                  ),
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                //signin button
                InkWell(
                  onTap: () {
                    signIn();
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.brown[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),

                //Not a member Register now
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not a Member ?"),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signup(),
                                ));
                          },
                          child: const Text(
                            " Register now",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
