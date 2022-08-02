// To parse this JSON data, do
//
//     final airPort = airPortFromJson(jsonString);

import 'dart:convert';

AirPort airPortFromJson(String str) => AirPort.fromJson(json.decode(str));

String airPortToJson(AirPort data) => json.encode(data.toJson());

class AirPort {
  AirPort({
    required this.items,
  });

  List<Item> items;

  factory AirPort.fromJson(Map<String, dynamic> json) => AirPort(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.icao,
    required this.iata,
    required this.name,
    required this.shortName,
    required this.municipalityName,
    required this.location,
    required this.countryCode,
  });

  String icao;
  String iata;
  String name;
  String shortName;
  String municipalityName;
  Location location;
  String countryCode;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        icao: json["icao"],
        iata: json["iata"],
        name: json["name"],
        shortName: json["shortName"],
        municipalityName: json["municipalityName"],
        location: Location.fromJson(json["location"]),
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata,
        "name": name,
        "shortName": shortName,
        "municipalityName": municipalityName,
        "location": location.toJson(),
        "countryCode": countryCode,
      };
}

class Location {
  Location({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
