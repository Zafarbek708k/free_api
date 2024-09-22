// // To parse this JSON data, do
// //
// //     final movieModel2 = movieModel2FromJson(jsonString);
//
// import 'dart:convert';
//
// import 'movie_model.dart';
//
// MovieModel2 movieModel2FromJson(String str) => MovieModel2.fromJson(json.decode(str));
//
// String movieModel2ToJson(MovieModel2 data) => json.encode(data.toJson());
//
// class MovieModel2 {
//   final int? page;
//   final List<Result>? results;
//   final int? totalPages;
//   final int? totalResults;
//
//   MovieModel2({
//     this.page,
//     this.results,
//     this.totalPages,
//     this.totalResults,
//   });
//
//   MovieModel2 copyWith({
//     int? page,
//     List<Result>? results,
//     int? totalPages,
//     int? totalResults,
//   }) =>
//       MovieModel2(
//         page: page ?? this.page,
//         results: results ?? this.results,
//         totalPages: totalPages ?? this.totalPages,
//         totalResults: totalResults ?? this.totalResults,
//       );
//
//   factory MovieModel2.fromJson(Map<String, dynamic> json) => MovieModel2(
//     page: json["page"],
//     results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
//     totalPages: json["total_pages"],
//     totalResults: json["total_results"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "page": page,
//     "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
//     "total_pages": totalPages,
//     "total_results": totalResults,
//   };
// }
//
// class Result {
//   final bool? adult;
//   final String? backdropPath;
//   final List<int>? genreIds;
//   final int? id;
//   final OriginalLanguage? originalLanguage;
//   final String? originalTitle;
//   final String? overview;
//   final double? popularity;
//   final String? posterPath;
//   final DateTime? releaseDate;
//   final String? title;
//   final bool? video;
//   final double? voteAverage;
//   final int? voteCount;
//
//   Result({
//     this.adult,
//     this.backdropPath,
//     this.genreIds,
//     this.id,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.releaseDate,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.voteCount,
//   });
//
//   Result copyWith({
//     bool? adult,
//     String? backdropPath,
//     List<int>? genreIds,
//     int? id,
//     OriginalLanguage? originalLanguage,
//     String? originalTitle,
//     String? overview,
//     double? popularity,
//     String? posterPath,
//     DateTime? releaseDate,
//     String? title,
//     bool? video,
//     double? voteAverage,
//     int? voteCount,
//   }) =>
//       Result(
//         adult: adult ?? this.adult,
//         backdropPath: backdropPath ?? this.backdropPath,
//         genreIds: genreIds ?? this.genreIds,
//         id: id ?? this.id,
//         originalLanguage: originalLanguage ?? this.originalLanguage,
//         originalTitle: originalTitle ?? this.originalTitle,
//         overview: overview ?? this.overview,
//         popularity: popularity ?? this.popularity,
//         posterPath: posterPath ?? this.posterPath,
//         releaseDate: releaseDate ?? this.releaseDate,
//         title: title ?? this.title,
//         video: video ?? this.video,
//         voteAverage: voteAverage ?? this.voteAverage,
//         voteCount: voteCount ?? this.voteCount,
//       );
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     adult: json["adult"],
//     backdropPath: json["backdrop_path"],
//     genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
//     id: json["id"],
//     originalLanguage: originalLanguageValues.map[json["original_language"]]!Z,
//     originalTitle: json["original_title"],
//     overview: json["overview"],
//     popularity: json["popularity"]?.toDouble(),
//     posterPath: json["poster_path"],
//     releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
//     title: json["title"],
//     video: json["video"],
//     voteAverage: json["vote_average"]?.toDouble(),
//     voteCount: json["vote_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "adult": adult,
//     "backdrop_path": backdropPath,
//     "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
//     "id": id,
//     "original_language": originalLanguageValues.reverse[originalLanguage],
//     "original_title": originalTitle,
//     "overview": overview,
//     "popularity": popularity,
//     "poster_path": posterPath,
//     "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
//     "title": title,
//     "video": video,
//     "vote_average": voteAverage,
//     "vote_count": voteCount,
//   };
// }
