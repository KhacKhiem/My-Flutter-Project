// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';
import 'global.dart';
import 'package:flutter_application_1/view/login.dart';

class Specifications extends StatelessWidget {
  Stations stations;
  ProcessingSystems systems;
  Specifications(this.stations, this.systems);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<ApiBloc>(context).add(fetch(Global.tokenn));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
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
                  'Specifications',
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
                                  stations.StationAddress.toString(),
                                  style: TextStyle(color: Global.white),
                                ),
                              ],
                            ),
                            Text(
                              stations.StationName.toString(),
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
              height: 380,
              width: 320,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Global.blue,
                    blurRadius: 20.0,
                  )
                ],
                color: Global.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 110,
                    width: 285,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Global.darkBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          child: SizedBox(
                            width: 90,
                            height: 90,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CircularProgressIndicator(
                                  value: (stations
                                          .processingSystems![0].waterLevel) /
                                      10,
                                  strokeWidth: 12,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation(
                                      Colors.indigo[300]),
                                ),
                                Center(
                                  child: Text(
                                    (systems.waterLevel).toString() + '0%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text('WATER LEVEL',
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 320,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Global.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(systems.waterPressure.toString() + ' Pa',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Global.white,
                                      fontFamily: 'Sf',
                                      fontSize: 25.0)),
                              Text(
                                'Pressure',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Global.white,
                                    fontFamily: 'Sf',
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Global.mediumBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(systems.processingSystemName.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Global.white,
                                      fontFamily: 'Sf',
                                      fontSize: 20.0)),
                              Text('System',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Global.lightGrey,
                                      fontFamily: 'Sf',
                                      fontSize: 20.0)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: 285,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Global.darkGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 110,
                          width: 140,
                          child: Text('Concentrations of Clo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          child: SizedBox(
                            width: 90,
                            height: 90,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  value: (systems.chlorineConcentration) / 100,
                                  strokeWidth: 12,
                                  backgroundColor: Colors.white,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.black),
                                ),
                                Center(
                                  child: Text(
                                      systems.chlorineConcentration.toString() +
                                          '%'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
