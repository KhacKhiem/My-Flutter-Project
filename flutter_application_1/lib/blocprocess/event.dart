import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model.dart';

class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDetail extends Event {
  String token;
  FetchDetail(this.token);
  String get authToken => token;
  @override
  List<Object?> get props => [token];
}

class FetchDetailsStation extends Event {
  Stations stationDetail;
  ProcessingSystems system;
  FetchDetailsStation(this.stationDetail, this.system);
  Stations get getDetail => stationDetail;
  ProcessingSystems get getSystem => system;
  @override
  List<Object?> get props => [stationDetail, system];
}

class fetchHistoryDetail extends Event {
  final id;
  Stations _station;
  fetchHistoryDetail(this.id, this._station);
  int get getHistory => id;
  Stations get station => _station;
  @override
  List<Object?> get props => [id, _station];
}
