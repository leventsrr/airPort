class AirPortDetail {
  List<Routes>? _routes;

  AirPortDetail({List<Routes>? routes}) {
    if (routes != null) {
      this._routes = routes;
    }
  }

  List<Routes>? get routes => _routes;
  set routes(List<Routes>? routes) => _routes = routes;

  AirPortDetail.fromJson(Map<String, dynamic> json) {
    if (json['routes'] != null) {
      _routes = <Routes>[];
      json['routes'].forEach((v) {
        _routes!.add(new Routes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._routes != null) {
      data['routes'] = this._routes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Routes {
  Destination? _destination;
  double? _averageDailyFlights;
  List<Operators>? _operators;

  Routes(
      {Destination? destination,
      double? averageDailyFlights,
      List<Operators>? operators}) {
    if (destination != null) {
      this._destination = destination;
    }
    if (averageDailyFlights != null) {
      this._averageDailyFlights = averageDailyFlights;
    }
    if (operators != null) {
      this._operators = operators;
    }
  }

  Destination? get destination => _destination;
  set destination(Destination? destination) => _destination = destination;
  double? get averageDailyFlights => _averageDailyFlights;
  set averageDailyFlights(double? averageDailyFlights) =>
      _averageDailyFlights = averageDailyFlights;
  List<Operators>? get operators => _operators;
  set operators(List<Operators>? operators) => _operators = operators;

  Routes.fromJson(Map<String, dynamic> json) {
    _destination = json['destination'] != null
        ? new Destination.fromJson(json['destination'])
        : null;
    _averageDailyFlights = json['averageDailyFlights'];
    if (json['operators'] != null) {
      _operators = <Operators>[];
      json['operators'].forEach((v) {
        _operators!.add(new Operators.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._destination != null) {
      data['destination'] = this._destination!.toJson();
    }
    data['averageDailyFlights'] = this._averageDailyFlights;
    if (this._operators != null) {
      data['operators'] = this._operators!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destination {
  String? _icao;
  String? _iata;
  String? _name;
  String? _shortName;
  String? _municipalityName;
  Location? _location;
  String? _countryCode;
  String? _localCode;

  Destination(
      {String? icao,
      String? iata,
      String? name,
      String? shortName,
      String? municipalityName,
      Location? location,
      String? countryCode,
      String? localCode}) {
    if (icao != null) {
      this._icao = icao;
    }
    if (iata != null) {
      this._iata = iata;
    }
    if (name != null) {
      this._name = name;
    }
    if (shortName != null) {
      this._shortName = shortName;
    }
    if (municipalityName != null) {
      this._municipalityName = municipalityName;
    }
    if (location != null) {
      this._location = location;
    }
    if (countryCode != null) {
      this._countryCode = countryCode;
    }
    if (localCode != null) {
      this._localCode = localCode;
    }
  }

  String? get icao => _icao;
  set icao(String? icao) => _icao = icao;
  String? get iata => _iata;
  set iata(String? iata) => _iata = iata;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get shortName => _shortName;
  set shortName(String? shortName) => _shortName = shortName;
  String? get municipalityName => _municipalityName;
  set municipalityName(String? municipalityName) =>
      _municipalityName = municipalityName;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  String? get localCode => _localCode;
  set localCode(String? localCode) => _localCode = localCode;

  Destination.fromJson(Map<String, dynamic> json) {
    _icao = json['icao'];
    _iata = json['iata'];
    _name = json['name'];
    _shortName = json['shortName'];
    _municipalityName = json['municipalityName'];
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _countryCode = json['countryCode'];
    _localCode = json['localCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icao'] = this._icao;
    data['iata'] = this._iata;
    data['name'] = this._name;
    data['shortName'] = this._shortName;
    data['municipalityName'] = this._municipalityName;
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    data['countryCode'] = this._countryCode;
    data['localCode'] = this._localCode;
    return data;
  }
}

class Location {
  double? _lat;
  double? _lon;

  Location({double? lat, double? lon}) {
    if (lat != null) {
      this._lat = lat;
    }
    if (lon != null) {
      this._lon = lon;
    }
  }

  double? get lat => _lat;
  set lat(double? lat) => _lat = lat;
  double? get lon => _lon;
  set lon(double? lon) => _lon = lon;

  Location.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    return data;
  }
}

class Operators {
  String? _name;

  Operators({String? name}) {
    if (name != null) {
      this._name = name;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;

  Operators.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    return data;
  }
}
