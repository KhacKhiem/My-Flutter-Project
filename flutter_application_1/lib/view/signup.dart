// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'login.dart';
import 'global.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Global.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Global.darkBlue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Global.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account, It's free ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Global.darkBlue,
                              blurRadius: 10.0,
                            )
                          ],
                          color: Global.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.length < 7) {
                                    return 'UserName should be more than 7 characters';
                                  }
                                },
                                decoration: InputDecoration(
                                  errorText:
                                      'UserName should be more than 7 characters',
                                  labelText: "UserName",
                                  border: OutlineInputBorder(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.length < 7) {
                                    return 'Password should be more than 7 characters';
                                  }
                                },
                                decoration: InputDecoration(
                                  errorText:
                                      'Password should be more than 7 characters',
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  labelText: "Firstname",
                                  border: OutlineInputBorder(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  labelText: "Lastname",
                                  border: OutlineInputBorder(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                  labelText: "Date of Birth",
                                  border: OutlineInputBorder(),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                createUser(context);
                              },
                              icon: Icon(Icons.login_rounded),
                              label: Text(
                                'Sign up',
                              ),
                            )
                          ],
                        ),
                      )
                    ]))));
  }

  Future<void> createUser(BuildContext context) async {
    final url =
        Uri.parse('https://sampleapiproject.azurewebsites.net/api/users');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": nameController.text,
          "password": passwordController.text,
          "firstname": firstnameController.text,
          "lastname": lastnameController.text,
          "dateOfBirth": dateController.text
        }));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sign up successful")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sign up unsuccessful")));
    }
  }
}
