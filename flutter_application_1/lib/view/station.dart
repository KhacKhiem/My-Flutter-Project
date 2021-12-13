import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'global.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocprocess/bloc.dart';
import 'package:flutter_application_1/blocprocess/event.dart';
import 'package:sizer/sizer.dart';

class Station extends StatelessWidget {
  final List<Stations>? stations;
  Station(this.stations);
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(child: Text('WELCOME USER')),
                  ListTile(
                    title: const Text("SPECIFICATIONS 1"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(FetchDetailsStation(
                          stations![0], stations![0].processingSystems![0]));
                    },
                  ),
                  ListTile(
                    title: const Text("REPORTS STATION 1"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                          stations![0].processingSystems![0].processingSystemId,
                          stations![0]));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: const Text("SPECIFICATIONS 2"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(FetchDetailsStation(
                          stations![1], stations![1].processingSystems![0]));
                    },
                  ),
                  ListTile(
                    title: const Text("REPORTS STATION 1"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                          stations![1].processingSystems![0].processingSystemId,
                          stations![1]));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: const Text("SPECIFICATIONS 3-1"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(FetchDetailsStation(
                          stations![2], stations![2].processingSystems![0]));
                    },
                  ),
                  ListTile(
                    title: const Text("REPORTS STATION 1"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(fetchHistoryDetail(
                          stations![2].processingSystems![0].processingSystemId,
                          stations![2]));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: const Text("SPECIFICATIONS 3-2"),
                    onTap: () {
                      BlocProvider.of<ApiBloc>(context).add(FetchDetailsStation(
                          stations![2], stations![2].processingSystems![1]));
                    },
                  ),
                  ListTile(
                    title: const Text("REPORTS STATION 1"),
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
              title: const Center(
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
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text('Station 1'),
                      ),
                    ),
                  ),
                  const Tab(
                    text: 'Station 2',
                  ),
                  const Tab(
                    text: 'Station 3-1',
                  ),
                  const Tab(
                    text: 'Station 3-2',
                  )
                ],
              ),
            ),
            body: OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return TabBarView(children: [
                  View(stations![0], stations![0].processingSystems![0]),
                  View(stations![1], stations![1].processingSystems![0]),
                  View(stations![2], stations![2].processingSystems![0]),
                  View(stations![2], stations![2].processingSystems![1]),
                ]);
              } else {
                return TabBarView(children: [
                  View2(stations![0], stations![0].processingSystems![0]),
                  View2(stations![1], stations![1].processingSystems![0]),
                  View2(stations![2], stations![2].processingSystems![0]),
                  View2(stations![2], stations![2].processingSystems![1]),
                ]);
              }
            })),
      );
}

class View extends StatelessWidget {
  final Stations station;
  final ProcessingSystems systems;
  View(this.station, this.systems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.lightBlue,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 90.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    boxShadow: const [
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
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Global.white,
                                      size: 10.sp,
                                    ),
                                    Text(
                                      station.stationAddress.toString(),
                                      style: TextStyle(
                                          color: Global.white, fontSize: 8.sp),
                                    ),
                                  ],
                                ),
                                Text(
                                  station.stationName.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Global.white,
                                      fontFamily: 'Sf',
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<ApiBloc>(context)
                                    .add(FetchDetailsStation(station, systems));
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
                                        fontSize: 8.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 40.h,
                                  width: 25.w,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 20.0,
                                      )
                                    ],
                                  ),
                                  child: systems.waterLevel! > 5
                                      ? FAProgressBar(
                                          currentValue: systems.waterLevel!,
                                          verticalDirection:
                                              VerticalDirection.up,
                                          size: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          displayText: '0%',
                                          progressColor: Colors.white,
                                          displayTextStyle: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                          direction: Axis.vertical,
                                          maxValue: 10,
                                          backgroundColor: Colors.black,
                                        )
                                      : FAProgressBar(
                                          currentValue: systems.waterLevel!,
                                          verticalDirection:
                                              VerticalDirection.up,
                                          size: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          displayText: '0%',
                                          progressColor: Colors.red,
                                          displayTextStyle: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                          direction: Axis.vertical,
                                          maxValue: 10,
                                          backgroundColor: Colors.black,
                                        )),
                              Text('Water Level',
                                  style: TextStyle(
                                      color: Global.white,
                                      fontFamily: 'Sf',
                                      fontSize: 8.sp)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 40.h,
                                width: 25.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 18.h,
                                      width: 25.w,
                                      decoration: const BoxDecoration(
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
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              systems.processingSystemName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Global.lightGrey,
                                                  fontFamily: 'Sf',
                                                  fontSize: 20.0)),
                                          const Text('System',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Global.lightGrey,
                                                  fontFamily: 'Sf',
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 25.w,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 20.0,
                                          )
                                        ],
                                      ),
                                      child: systems.chlorineConcentration! > 30
                                          ? FAProgressBar(
                                              currentValue: systems
                                                  .chlorineConcentration!,
                                              verticalDirection:
                                                  VerticalDirection.up,
                                              size: 100,
                                              displayText: '%',
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              progressColor: Colors.white,
                                              displayTextStyle: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold),
                                              direction: Axis.vertical,
                                              maxValue: 100,
                                              backgroundColor: Colors.black,
                                            )
                                          : FAProgressBar(
                                              currentValue: systems
                                                  .chlorineConcentration!,
                                              verticalDirection:
                                                  VerticalDirection.up,
                                              size: 100,
                                              displayText: '%',
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              progressColor: Colors.redAccent,
                                              displayTextStyle: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold),
                                              direction: Axis.vertical,
                                              maxValue: 100,
                                              backgroundColor: Colors.black,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('  Chlorine ',
                                  style: TextStyle(
                                      color: Global.white,
                                      fontFamily: 'Sf',
                                      fontSize: 8.sp)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<ApiBloc>(context).add(
                      fetchHistoryDetail(systems.processingSystemId, station));
                },
                child: Container(
                  width: 30.w,
                  margin: const EdgeInsets.only(top: 10, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Read history',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Global.blue,
                              fontFamily: 'Sf',
                              fontSize: 8.sp)),
                      Icon(
                        Icons.arrow_forward,
                        color: Global.blue,
                        size: 10.sp,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class View2 extends StatelessWidget {
  final Stations station;
  final ProcessingSystems systems;
  View2(this.station, this.systems);

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Global.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 80.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: const [
                  BoxShadow(
                    color: Global.blue,
                    blurRadius: 40.0,
                  )
                ],
                color: Global.blue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Global.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  station.stationAddress.toString(),
                                  style: const TextStyle(color: Global.white),
                                ),
                              ],
                            ),
                            Text(
                              station.stationName.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Global.white,
                                  fontFamily: 'Sf',
                                  fontSize: 10.sp),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<ApiBloc>(context)
                                .add(FetchDetailsStation(station, systems));
                          },
                          child: Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Global.white,
                            ),
                            child: const Center(
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
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<ApiBloc>(context).add(
                                fetchHistoryDetail(
                                    systems.processingSystemId, station));
                          },
                          child: Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Global.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Read history',
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
                  Column(
                    children: [
                      const Text('Water Level',
                          style: TextStyle(
                              color: Global.white,
                              fontFamily: 'Sf',
                              fontSize: 15.0)),
                      Container(
                          height: 43.h,
                          width: 12.w,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 20.0,
                              )
                            ],
                          ),
                          child: systems.waterLevel! > 5
                              ? FAProgressBar(
                                  currentValue: systems.waterLevel!,
                                  verticalDirection: VerticalDirection.up,
                                  size: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  displayText: '0%',
                                  progressColor: Colors.white,
                                  displayTextStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  direction: Axis.vertical,
                                  maxValue: 10,
                                  backgroundColor: Colors.black,
                                )
                              : FAProgressBar(
                                  currentValue: systems.waterLevel!,
                                  verticalDirection: VerticalDirection.up,
                                  size: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  displayText: '0%',
                                  progressColor: Colors.red,
                                  displayTextStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  direction: Axis.vertical,
                                  maxValue: 10,
                                  backgroundColor: Colors.black,
                                )),
                    ],
                  ),
                  Container(
                    height: 43.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(systems.processingSystemName.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Global.lightGrey,
                                fontFamily: 'Sf',
                                fontSize: 20.0)),
                        Text('System',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Global.lightGrey,
                                fontFamily: 'Sf',
                                fontSize: 8.sp)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Text('  Chlorine ',
                          style: TextStyle(
                              color: Global.white,
                              fontFamily: 'Sf',
                              fontSize: 15.0)),
                      Container(
                        height: 43.h,
                        width: 12.w,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                            )
                          ],
                        ),
                        child: systems.chlorineConcentration! > 30
                            ? FAProgressBar(
                                currentValue: systems.chlorineConcentration!,
                                verticalDirection: VerticalDirection.up,
                                size: 100,
                                displayText: '%',
                                borderRadius: BorderRadius.circular(15),
                                progressColor: Colors.white,
                                displayTextStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                direction: Axis.vertical,
                                maxValue: 100,
                                backgroundColor: Colors.black,
                              )
                            : FAProgressBar(
                                currentValue: systems.chlorineConcentration!,
                                verticalDirection: VerticalDirection.up,
                                size: 100,
                                displayText: '%',
                                borderRadius: BorderRadius.circular(15),
                                progressColor: Colors.redAccent,
                                displayTextStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                direction: Axis.vertical,
                                maxValue: 100,
                                backgroundColor: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
