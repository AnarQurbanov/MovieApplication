import 'package:movie_application/feature/_model/results_model.dart';

class MovieModel {
  String? page;
  String? next;
  int? entries;
  List<Results>? results;
  MovieModel({this.page, this.next, this.entries, this.results});
  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    next = json['next'];
    entries = json['entries'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['next'] = this.next;
    data['entries'] = this.entries;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
