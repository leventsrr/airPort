import 'package:air_ports/data/models/airport_model.dart';
import 'package:dio/dio.dart';

import '../models/airport_details_model.dart';

class AirPortRequest {
  static String _apiKey = '1bd5e87f33mshf1aeef959573101p15333ejsn40477d66287f';
  late Dio _dio;

  AirPortRequest() {
    _dio = Dio(
      BaseOptions(
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'aerodatabox.p.rapidapi.com'
        },
      ),
    );
  }

  Future<List<Item>?> getAirportInformation(String airportName) async {
    String _url =
        'https://aerodatabox.p.rapidapi.com/airports/search/term?q=$airportName&limit=10';

    try {
      Response response = await _dio.get(
        _url,
      );
      AirPort airport = AirPort.fromJson(response.data);
      return airport.items;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Routes>?> getAirportDetails(String icaoCode) async {
    String _url =
        'https://aerodatabox.p.rapidapi.com/airports/icao/$icaoCode/stats/routes/daily';

    try {
      Response response = await _dio.get(
        _url,
      );
      AirPortDetail airPortDetail = AirPortDetail.fromJson(response.data);

      return airPortDetail.routes;
    } catch (e) {
      print(e.toString());
    }
  }
}
