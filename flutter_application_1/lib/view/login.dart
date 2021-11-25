// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/reports.dart';
import 'package:flutter_application_1/view/specifi.dart';
import 'station.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';
import 'package:flutter_application_1/blocprocess/state.dart';
import 'global.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model.dart';

class Login extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginResponse loginResponse = LoginResponse();
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
        if (state is UnLoad)
          // ignore: curly_braces_in_flow_control_structures
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Global.darkBlue,
                      Global.blue,
                    ])),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                      height: 270,
                      width: 340,
                      decoration: BoxDecoration(
                        color: Global.lightGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(30),
                              height: 120,
                              width: 310,
                              decoration: BoxDecoration(
                                color: Colors.indigo[400],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 110, top: 32),
                            width: 210,
                            height: 210,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Global.lightBlue,
                                  blurRadius: 10.0,
                                )
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 320,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: 'Your name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 320,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.password, color: Colors.black),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Global.darkBlue,
                          blurRadius: 20.0,
                        )
                      ],
                    ),
                    width: 320,
                    child: FloatingActionButton.extended(
                        onPressed: () {
                          login(context);
                        },
                        heroTag: 'contact2',
                        label: Text('Login',
                            style: TextStyle(fontSize: 25, fontFamily: 'Sf')),
                        backgroundColor: Global.blue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 20, left: 170, right: 160),
                        child: Row(
                          children: [
                            Text('Not a member? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Sf',
                                    fontSize: 15.0)),
                            Text('Sign Up Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Sf',
                                    fontSize: 15.0)),
                          ],
                        ),
                      ))
                ],
              ),
            ],
          );
        if (state is Loading)
          return Center(child: CircularProgressIndicator());
        else if (state is Loaded)
          return Station(state.stations);
        else if (state is LoadDetail)
          return Specifications(state.stationDetail, state.systems);
        else if (state is LoadHistory)
          return Reports(state.history, state.stations);
        else
          return Container(child: Text('Cant fetch data'));
      }),
    );
  }

  Future<void> login(BuildContext context) async {
    final url =
        Uri.parse('https://sampleapiproject.azurewebsites.net/api/auth');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": _nameController.text,
          "password": _passwordController.text,
        }));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final jsonToken = jsonResponse["token"];
      final jsonauthToken = jsonToken["authToken"];
      print(jsonauthToken);
      BlocProvider.of<ApiBloc>(context).add(fetch(jsonauthToken));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login unsuccessful")));
    }
  }
}
