import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'global.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';

class Station extends StatelessWidget {
  List<Stations>? stations;
  Station(this.stations);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text('WELCOME USER')),
              ListTile(
                title: new Text("SPECIFICATIONS 1"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchDetailsStation(
                      stations![0], stations![0].processingSystems![0]));
                },
              ),
              ListTile(
                title: new Text("REPORTS STATION 1"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                      stations![0].processingSystems![0].processingSystemId,
                      stations![0]));
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: new Text("SPECIFICATIONS 2"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchDetailsStation(
                      stations![1], stations![1].processingSystems![0]));
                },
              ),
              ListTile(
                title: new Text("REPORTS STATION 1"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                      stations![1].processingSystems![0].processingSystemId,
                      stations![1]));
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: new Text("SPECIFICATIONS 3-1"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchDetailsStation(
                      stations![2], stations![2].processingSystems![0]));
                },
              ),
              ListTile(
                title: new Text("REPORTS STATION 1"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                      stations![2].processingSystems![0].processingSystemId,
                      stations![2]));
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: new Text("SPECIFICATIONS 3-2"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchDetailsStation(
                      stations![2], stations![2].processingSystems![1]));
                },
              ),
              ListTile(
                title: new Text("REPORTS STATION 1"),
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                      stations![2].processingSystems![1].processingSystemId,
                      stations![2]));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Station',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Global.white,
                  fontFamily: 'Sf',
                  fontSize: 30.0),
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Global.darkGrey,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Global.blue,
            ),
            tabs: <Widget>[
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Station 1'),
                  ),
                ),
              ),
              Tab(
                text: 'Station 2',
              ),
              Tab(
                text: 'Station 3-1',
              ),
              Tab(
                text: 'Station 3-2',
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: TabBarView(children: [
                View(stations![0], stations![0].processingSystems![0]),
                View(stations![1], stations![1].processingSystems![0]),
                View(stations![2], stations![2].processingSystems![0]),
                View(stations![2], stations![2].processingSystems![1]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  Stations station;
  ProcessingSystems systems;
  View(this.station, this.systems);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Global.lightBlue,
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              width: screenWidth - 40,
              height: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Global.blue,
                    blurRadius: 40.0,
                  )
                ],
                color: Global.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 24.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<ApiBloc>(context)
                                .add(fetchDetailsStation(station, systems));
                          },
                          child: Container(
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Global.white,
                            ),
                            child: Center(
                              child: Text(
                                'View more',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Global.blue,
                                    fontFamily: 'Sf',
                                    fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              height: 220,
                              width: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 20.0,
                                  )
                                ],
                              ),
                              child: systems.waterLevel > 5
                                  ? FAProgressBar(
                                      currentValue: systems.waterLevel,
                                      verticalDirection: VerticalDirection.up,
                                      size: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      displayText: '0%',
                                      progressColor: Colors.white,
                                      displayTextStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      direction: Axis.vertical,
                                      maxValue: 10,
                                      backgroundColor: Colors.black,
                                    )
                                  : FAProgressBar(
                                      currentValue: systems.waterLevel,
                                      verticalDirection: VerticalDirection.up,
                                      size: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      displayText: '0%',
                                      progressColor: Colors.red,
                                      displayTextStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      direction: Axis.vertical,
                                      maxValue: 10,
                                      backgroundColor: Colors.black,
                                    )),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                )
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(systems.processingSystemName.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Global.lightGrey,
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
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                )
                              ],
                            ),
                            child: systems.chlorineConcentration > 30
                                ? FAProgressBar(
                                    currentValue: systems.chlorineConcentration,
                                    verticalDirection: VerticalDirection.up,
                                    size: 100,
                                    displayText: '%',
                                    borderRadius: BorderRadius.circular(15),
                                    progressColor: Colors.white,
                                    displayTextStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    direction: Axis.vertical,
                                    maxValue: 100,
                                    backgroundColor: Colors.black,
                                  )
                                : FAProgressBar(
                                    currentValue: systems.chlorineConcentration,
                                    verticalDirection: VerticalDirection.up,
                                    size: 100,
                                    displayText: '%',
                                    borderRadius: BorderRadius.circular(15),
                                    progressColor: Colors.redAccent,
                                    displayTextStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    direction: Axis.vertical,
                                    maxValue: 100,
                                    backgroundColor: Colors.black,
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text('Water Level',
                          style: TextStyle(
                              color: Global.white,
                              fontFamily: 'Sf',
                              fontSize: 15.0)),
                      SizedBox(
                        width: 70,
                      ),
                      Text('  Chlorine ',
                          style: TextStyle(
                              color: Global.white,
                              fontFamily: 'Sf',
                              fontSize: 15.0)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 240, top: 10),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ApiBloc>(context).add(
                    fetchHistoryDetail(systems.processingSystemId, station));
              },
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 10, right: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text('Read history',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Global.blue,
                            fontFamily: 'Sf',
                            fontSize: 13.0)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_forward, color: Global.blue)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
