import 'dart:convert';

import 'package:application/core/helper/api_constants.dart';
import 'package:application/features/home/data/models/popular_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<PopularResponse> getPopularMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi,
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }
}
