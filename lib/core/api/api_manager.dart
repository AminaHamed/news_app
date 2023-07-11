import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/model/NewsResponse.dart';
import 'package:news_app/core/model/SourcesResponse.dart';

class ApiManager{
  
static const String baseUrl="newsapi.org";
static const String apiKey='62eb64851bf5414a8ad25edbeeb1e3ce';

 static Future< SourcesResponse> getSources(
     String categoryId
     ) async {
   var url= Uri.https(baseUrl,'/v2/top-headlines/sources',{
      'apiKey':apiKey,
      'category':categoryId
    });
    var response=await http.get(
      url
        );
    // String stringBody=response.body;
    // var json=jsonDecode(stringBody);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }
  
 static Future<NewsResponse> getNews(
     {String? sourcesId,
   String? newsKeyword,
     int? page
     }
     ) async {
   var uri=Uri.https(baseUrl,'/v2/everything',{
     'apiKey':apiKey,
     'sources':sourcesId,
     'q':newsKeyword,
     'page':'$page',
     'pageSize':'40'
   });

  var response=await http.get(uri);
  var responseString=response.body;
 return NewsResponse.fromJson( jsonDecode(responseString));
  }

}