import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/view/station.dart';

class ApiState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnLoad extends ApiState {}

class Loading extends ApiState {}

class Loaded extends ApiState {
  List<Stations> stations;
  Loaded(this.stations);
  //List<Stations> get station => stations;
  @override
  // TODO: implement props
  List<Object?> get props => [stations];
}

class NotLoaded extends ApiState {}

class LoadDetail extends ApiState {
  Stations stationDetail;
  ProcessingSystems systems;
  LoadDetail(this.stationDetail, this.systems);
  @override
  // TODO: implement props
  List<Object?> get props => [stationDetail, systems];
}

class LoadHistory extends ApiState {
  List<ChlorineInjections> history;
  Stations _stations;
  LoadHistory(this.history, this._stations);
  List<ChlorineInjections> get his => history;
  Stations get stations => _stations;
  @override
  // TODO: implement props
  List<Object?> get props => [history, _stations];
}
