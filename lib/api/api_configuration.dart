import 'package:http/http.dart' as http;
import 'dart:convert';
import 'satellite_data.dart';

class ApiConfiguration {
  static const String _baseUrl = "https://sat.terrestre.ar";

  static Future<SatelliteData> fetchSatellitePasses({
    required int sateliteId,
    required double lat,
    required double lon,
    int limit = 10,
    bool visibleOnly = false,
  }) async {
    final String url =
        "$_baseUrl/passes/$sateliteId?lat=$lat&lon=$lon&limit=$limit&visible_only=$visibleOnly";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return SatelliteData.fromJson(data);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
      rethrow;
    }
  }
}
