import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocprocess/bloc.dart';
import 'package:flutter_application_1/view/login.dart';
import 'httpser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigo,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: BlocProvider<ApiBloc>(
            create: (context) => ApiBloc(HttpService()),
            child: Login(),
          ),
        ));
  }
}
