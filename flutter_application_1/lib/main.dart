import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocprocess/bloc.dart';
import 'package:flutter_application_1/view/login.dart';
import 'httpser.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      return MaterialApp(
          title: 'Flutter App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.indigo,
          ),
          /*    builder: (context, widget) => ResponsiveWrapper.builder(
                  BouncingScrollWrapper.builder(context, widget!),
                  maxWidth: 1200,
                  minWidth: 300,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.autoScale(300, name: MOBILE),
                    const ResponsiveBreakpoint.resize(400, name: MOBILE),
                    const ResponsiveBreakpoint.resize(800, name: DESKTOP),
                  ]),*/
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            body: BlocProvider<ApiBloc>(
              create: (context) => ApiBloc(HttpService()),
              child: Login(),
            ),
          ));
    });
  }
}
