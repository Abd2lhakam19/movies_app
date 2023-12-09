class SimilarResponse {
  SimilarResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.status_code,
    this.status_message,
  });

  SimilarResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    status_code = json['status_code'];
    status_message = json['status_message'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  int? status_code;
  String? status_message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

/// adult : false
/// backdrop_path : "/c7cDh1TxysP6CwaxEzQl9oaoXZ2.jpg"
/// genre_ids : [35]
/// id : 368001
/// original_language : "es"
/// original_title : "07 con el 2 delante (Agente: Jaime Bonet)"
/// overview : "The improvised spy, Jaime Bonet, must go to Barcelona to recover a stolen microfilm which is hidden in a soccer ball."
/// popularity : 1.353
/// poster_path : "/pSFffwY9bQWoxfqM2uy1V62xHWo.jpg"
/// release_date : "1966-05-09"
/// title : "07 with 2 in front"
/// video : false
/// vote_average : 0.0
/// vote_count : 0

class Results {
  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
