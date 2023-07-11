
import 'News.dart';

class NewsResponse {
  String? status;
  String? code;
  String? message;
  num? totalResults;
  List<Articles>? articles;
  NewsResponse({
      this.status, 
      this.code,
      this.message,
      this.totalResults,
      this.articles,

  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }

NewsResponse copyWith({  String? status,
  num? totalResults,
  List<Articles>? articles,
}) => NewsResponse(  status: status ?? this.status,
  totalResults: totalResults ?? this.totalResults,
  articles: articles ?? this.articles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



