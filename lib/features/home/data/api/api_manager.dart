import 'dart:convert';

import 'package:application/core/helper/api_constants.dart';
import 'package:application/features/home/data/models/new_releases_response.dart';
import 'package:application/features/home/data/models/popular_response.dart';
import 'package:application/features/home/data/models/recomended_response.dart';
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
      rethrow;
    }
  }

  static Future<RecomendedReponse> getRecomendedMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.recomendedApi,
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RecomendedReponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewReleasesResponse> getNewReleasesMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesApi,
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewReleasesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
