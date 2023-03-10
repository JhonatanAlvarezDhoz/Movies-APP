import 'dart:convert';

import 'package:practica/models/models.dart';

class PupularResponse {
  PupularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PupularResponse.fromJson(String str) =>
      PupularResponse.fromMap(json.decode(str));

  factory PupularResponse.fromMap(Map<String, dynamic> json) => PupularResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
