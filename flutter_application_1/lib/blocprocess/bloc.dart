import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/model.dart';
import 'event.dart';
import 'state.dart';
import 'package:flutter_application_1/httpser.dart';

class ApiBloc extends Bloc<Event, ApiState> {
  HttpService httpService;

  ApiBloc(this.httpService) : super(UnLoad()) {
    on<FetchDetail>(_onFetchDetails);
    on<FetchDetailsStation>(
        (event, emit) => emit(LoadDetail(event.getDetail, event.getSystem)));
    on<fetchHistoryDetail>(_onFetchHistory);
  }

  Future<void> _onFetchDetails(Event event, Emitter<ApiState> emit) async {
    if (event is FetchDetail) {
      emit(Loading());
      try {
        List<Stations> stations =
            await httpService.getStations(event.authToken);
        return emit(Loaded(stations));
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _onFetchHistory(Event event, Emitter<ApiState> emit) async {
    if (event is fetchHistoryDetail) {
      emit(Loading());
      try {
        List<ChlorineInjections> history =
            await httpService.gethistory(event.getHistory);
        Stations station = event.station;
        return emit(LoadHistory(history, station));
      } catch (_) {
        return emit(NotLoaded());
      }
    }
  }
}
