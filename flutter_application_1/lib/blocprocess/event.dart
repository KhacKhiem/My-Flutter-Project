import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model.dart';

class Event extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class fetch extends Event {
  var token;
  fetch(this.token);
  String get authToken => token;
  List<Object?> get props => [token];
}

class fetchDetailsStation extends Event {
  Stations _stationDetail;
  ProcessingSystems _system;
  fetchDetailsStation(this._stationDetail, this._system);
  Stations get getDetail => _stationDetail;
  ProcessingSystems get getSystem => _system;
  @override
  // TODO: implement props
  List<Object?> get props => [_stationDetail, _system];
}

class fetchHistoryDetail extends Event {
  final ID;
  Stations _station;
  fetchHistoryDetail(this.ID, this._station);
  int get getHistory => ID;
  Stations get station => _station;
  @override
  // TODO: implement props
  List<Object?> get props => [ID, _station];
}
