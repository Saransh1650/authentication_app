import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();

  void createAccount() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String cpassword = cpasswordcontroller.text.trim();

    if (email == "" || password == "" || cpassword == "") {
      log("Please enter values");
    } else if (password != cpassword) {
      log("please check password field");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Create an account"),
          backgroundColor: Colors.brown[300],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: emailcontroller,
                      decoration:
                          const InputDecoration(labelText: "Email Address"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordcontroller,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: cpasswordcontroller,
                      decoration:
                          const InputDecoration(labelText: "Confirm Password"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        createAccount();
                      },
                      color: Colors.brown[300],
                      child: const Text("Create Account"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
