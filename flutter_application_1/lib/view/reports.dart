// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:intl/intl.dart';
import 'global.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reports extends StatelessWidget {
  List<ChlorineInjections> history;
  Stations station;
  Reports(this.history, this.station);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<ApiBloc>(context).add(fetch(Global.tokenn));
          },
          icon: Icon(Icons.arrow_back),
          color: Global.white,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              width: 320,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Global.blue,
                    blurRadius: 10.0,
                  )
                ],
                color: Global.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reports',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Global.white,
                        fontFamily: 'Sf',
                        fontSize: 25.0),
                  ),
                  Container(
                    height: 100,
                    width: 300,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Global.darkBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Global.white,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    station.StationAddress.toString(),
                                    style: TextStyle(color: Global.white),
                                  ),
                                ],
                              ),
                              Text(
                                station.StationName.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Global.white,
                                    fontFamily: 'Sf',
                                    fontSize: 25.0),
                              ),
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 200,
              height: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Global.darkGrey,
                    blurRadius: 5.0,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Global.white,
              ),
              child: Text(
                'Recent Activities',
                style: TextStyle(fontSize: 24, color: Global.blue),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 300,
              width: 350,
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                              color: Global.darkGrey,
                              blurRadius: 5.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Global.darkBlue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                DateFormat("yyyy-MM-dd HH:mm:ss").format(
                                    DateTime.parse(history[index]
                                        .injectionTime
                                        .toString())),
                                style: TextStyle(
                                    color: Global.white,
                                    fontFamily: 'Sf',
                                    fontSize: 13.0)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(history[index].employeeName.toString(),
                                    style: TextStyle(
                                        color: Global.white,
                                        fontFamily: 'Sf',
                                        fontSize: 13.0)),
                                Text(
                                    '+' +
                                        history[index]
                                            .chlorineVolume
                                            .toString(),
                                    style: TextStyle(
                                        color: Global.white,
                                        fontFamily: 'Sf',
                                        fontSize: 13.0)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 8,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
