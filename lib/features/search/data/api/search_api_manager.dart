import 'dart:convert';
import 'package:application/core/helper/api_constants.dart';
import 'package:application/features/home/data/models/movie_details_response.dart';
import 'package:application/features/search/data/models/search_response.dart';
import 'package:http/http.dart' as http;

class SearchApiManager {
  static Future<SearchResponse> searchMovie(String movieName) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.searchMovieApi,
        {'api_key': ApiConstants.apiKey, 'query': movieName});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
