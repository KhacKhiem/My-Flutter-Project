// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:intl/intl.dart';
import 'global.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Reports extends StatelessWidget {
  final List<ChlorineInjections> history;
  final Stations station;
  Reports(this.history, this.station);
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<ApiBloc>(context).add(FetchDetail(Global.tokenn));
          },
          icon: Icon(Icons.arrow_back),
          color: Global.white,
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return portraitView();
        } else {
          return landscapeView();
        }
      }));

  Widget portraitView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20.h,
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
            padding: EdgeInsets.all(10),
            child: stationInfo(),
          ),
          Container(
            width: 60.w,
            height: 5.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
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
              style: TextStyle(fontSize: 12.sp, color: Global.blue),
            ),
          ),
          stationHistory(),
        ],
      ),
    );
  }

  Widget landscapeView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 320,
          width: 320,
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
          padding: EdgeInsets.all(10),
          child: stationInfoLandscape(),
        ),
        stationHistory(),
      ],
    );
  }

  Widget stationInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Reports',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Global.white,
              fontFamily: 'Sf',
              fontSize: 25.sp),
        ),
        Container(
          height: 10.h,
          width: 70.w,
          decoration: BoxDecoration(
            color: Global.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Global.white,
                      size: 15,
                    ),
                    Text(
                      station.stationAddress.toString(),
                      style: TextStyle(color: Global.white),
                    ),
                  ],
                ),
                Text(
                  station.stationName.toString(),
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
          'Reports',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Global.white,
              fontFamily: 'Sf',
              fontSize: 18.sp),
        ),
        Container(
          height: 35.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Global.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Global.white,
                      size: 10.sp,
                    ),
                    Text(
                      station.stationAddress.toString(),
                      style: TextStyle(color: Global.white, fontSize: 8.sp),
                    ),
                  ],
                ),
                Text(
                  station.stationName.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Global.white,
                      fontFamily: 'Sf',
                      fontSize: 12.sp),
                ),
              ]),
            ],
          ),
        )
      ],
    );
  }

  Widget stationHistory() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 300,
      width: 320,
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
                        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.parse(
                            history[index].injectionTime.toString())),
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
                        Text('+' + history[index].chlorineVolume.toString(),
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
    );
  }
}
