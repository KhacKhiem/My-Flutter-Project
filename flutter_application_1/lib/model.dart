class ChlorineInjections {
  int? chlorineInjectionId;
  int? chlorineVolume;
  String? employeeName;
  String? injectionTime;
  int? processingSystemId;

  ChlorineInjections(
      {this.chlorineInjectionId,
      this.chlorineVolume,
      this.employeeName,
      this.injectionTime,
      this.processingSystemId});

  factory ChlorineInjections.fromJson(Map<String, dynamic> json) {
    return ChlorineInjections(
      chlorineInjectionId: json["chlorineInjectionId"] as int,
      chlorineVolume: json["amountOfChlorine"] as int,
      employeeName: json["employeeName"] as String,
      injectionTime: json["injectionTime"] as String,
      processingSystemId: json["processingSystemId"] as int,
    );
  }
}

// thông số
class ProcessingSystems {
  int? processingSystemId;
  String? processingSystemName;
  int? waterLevel;
  int? waterPressure;
  int? chlorineConcentration;
  int? stationId;
  List<ChlorineInjections>? chlorineInjections;
  ProcessingSystems(
      {this.processingSystemId,
      this.processingSystemName,
      this.waterLevel,
      this.waterPressure,
      this.chlorineConcentration,
      this.stationId,
      this.chlorineInjections});
  factory ProcessingSystems.fromJson(Map<String, dynamic> json) {
    return ProcessingSystems(
        processingSystemId: json["processingSystemId"] as int,
        processingSystemName: json["processingSystemName"] as String,
        waterLevel: json["waterLevel"] as int,
        waterPressure: json["waterPressure"] as int,
        chlorineConcentration: json["chlorineConcentration"] as int,
        stationId: json["stationId"] as int,
        chlorineInjections: json["chlorineInjections"] == null
            ? []
            : (json["chlorineInjections"] as List)
                .map((e) => ChlorineInjections.fromJson(e))
                .toList());
  }
}

class Stations {
  int? stationID;
  String? stationName;
  String? stationAddress;
  List<ProcessingSystems>? processingSystems;
  Stations({
    this.stationID,
    this.stationAddress,
    this.stationName,
    this.processingSystems,
  });
  factory Stations.fromJson(Map<String, dynamic> json) {
    return Stations(
        stationID: json['stationId'] as int,
        stationName: json['stationName'] as String,
        stationAddress: json['stationAddress'] as String,
        processingSystems: json["processingSystems"] == null
            ? []
            : (json["processingSystems"] as List)
                .map((e) => ProcessingSystems.fromJson(e))
                .toList());
  }
}

class Signup {
  String? name;
  String? password;
  String? firstname;
  String? lastname;
  DateTime? dateOfbirth;

  Signup(
      {this.name,
      this.password,
      this.firstname,
      this.lastname,
      this.dateOfbirth});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = this.name;
    data['password'] = this.password;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['dateOfBirth'] = this.dateOfbirth;

    return data;
  }
}

class LoginRequest {
  String? name;
  String? password;

  LoginRequest({this.name, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.name;
    data["password"] = this.password;

    return data;
  }
}

class LoginResponse {
  int? id;
  String? token;

  LoginResponse({this.id, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json["id"],
      token: json["authToken"],
    );
  }
}
