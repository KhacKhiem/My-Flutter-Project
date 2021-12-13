// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';
import 'package:sizer/sizer.dart';
import 'global.dart';

class Specifications extends StatelessWidget {
  final Stations stations;
  final ProcessingSystems systems;
  Specifications(this.stations, this.systems);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<ApiBloc>(context).add(FetchDetail(Global.tokenn));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return portraintView();
        } else {
          return landscapeView();
        }
      }));

  Widget stationInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Specifications',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Global.white,
              fontFamily: 'Sf',
              fontSize: 30.sp),
        ),
        Container(
          height: 10.h,
          width: 70.w,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Global.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Global.white,
                          size: 15,
                        ),
                        Text(
                          stations.stationAddress.toString(),
                          style: TextStyle(color: Global.white),
                        ),
                      ],
                    ),
                    Text(
                      stations.stationName.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Global.white,
                          fontFamily: 'Sf',
                          fontSize: 22.sp),
                    ),
                  ]),
            ],
          ),
        )
      ],
    );
  }

  Widget stationInfoLandscape() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Specifications',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Global.white,
              fontFamily: 'Sf',
              fontSize: 15.sp),
        ),
        Container(
          height: 20.h,
          width: 40.w,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Global.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Global.white,
                          size: 15,
                        ),
                        Text(
                          stations.stationAddress.toString(),
                          style: TextStyle(color: Global.white),
                        ),
                      ],
                    ),
                    Text(
                      stations.stationName.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Global.white,
                          fontFamily: 'Sf',
                          fontSize: 15.sp),
                    ),
                  ]),
            ],
          ),
        )
      ],
    );
  }

  Widget stationSpecificationsDetail1() {
    return Container(
      height: 17.h,
      width: 70.w,
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
          SizedBox(
            height: 15.h,
            width: 15.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: (stations.processingSystems![0].waterLevel!) / 10,
                  strokeWidth: 12,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.indigo[300]),
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
          Text('WATER \n LEVEL',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp))
        ],
      ),
    );
  }

  Widget stationSpecificationsDetail1Landscape() {
    return Container(
      height: 30.h,
      width: 40.w,
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
          SizedBox(
            height: 25.h,
            width: 25.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: (stations.processingSystems![0].waterLevel!) / 10,
                  strokeWidth: 12,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.indigo[300]),
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
          Text('WATER \n LEVEL',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp))
        ],
      ),
    );
  }

  Widget stationSpecificationsDetail2() {
    return SizedBox(
      height: 17.h,
      width: 70.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 17.h,
            width: 34.w,
            decoration: BoxDecoration(
              color: Global.darkBlue,
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
                        fontSize: 10.sp)),
                Text(
                  'Pressure',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Global.white,
                      fontFamily: 'Sf',
                      fontSize: 10.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 17.h,
            width: 34.w,
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
                        fontSize: 10.sp)),
                Text('System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Global.lightGrey,
                        fontFamily: 'Sf',
                        fontSize: 10.sp)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget stationSpecificationsDetail2Landscape() {
    return SizedBox(
      height: 30.h,
      width: 40.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 30.h,
            width: 18.w,
            decoration: BoxDecoration(
              color: Global.darkBlue,
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
                        fontSize: 10.sp)),
                Text(
                  'Pressure',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Global.white,
                      fontFamily: 'Sf',
                      fontSize: 10.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 30.h,
            width: 18.w,
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
                        fontSize: 10.sp)),
                Text('System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Global.lightGrey,
                        fontFamily: 'Sf',
                        fontSize: 10.sp)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget stationSpecificationsDetail3() {
    return Container(
        height: 17.h,
        width: 70.w,
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
            Text('Clo \nLevel',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Sf',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp)),
            SizedBox(
              height: 15.h,
              width: 15.h,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CircularProgressIndicator(
                    value: (systems.chlorineConcentration!) / 100,
                    strokeWidth: 12,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                  Center(
                    child: Text(systems.chlorineConcentration.toString() + '%'),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget stationSpecificationsDetail3Landscape() {
    return Container(
        height: 30.h,
        width: 40.w,
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
            Text('Clo \nLevel',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Sf',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp)),
            SizedBox(
              height: 25.h,
              width: 25.h,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CircularProgressIndicator(
                    value: (systems.chlorineConcentration!) / 100,
                    strokeWidth: 12,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                  Center(
                    child: Text(systems.chlorineConcentration.toString() + '%'),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget portraintView() {
    return Center(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                  height: 22.h,
                  width: 80.w,
                  margin: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
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
                  padding: EdgeInsets.all(5),
                  child: stationInfo()),
              Container(
                height: 60.h,
                width: 80.w,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    stationSpecificationsDetail1(),
                    stationSpecificationsDetail2(),
                    stationSpecificationsDetail3(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget landscapeView() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 80.h,
              width: 45.w,
              decoration: const BoxDecoration(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  stationInfoLandscape(),
                  stationSpecificationsDetail2Landscape(),
                ],
              )),
          Container(
            height: 80.h,
            width: 45.w,
            padding: EdgeInsets.all(5),
            decoration: const BoxDecoration(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                stationSpecificationsDetail1Landscape(),
                stationSpecificationsDetail3Landscape(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
