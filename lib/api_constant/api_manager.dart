import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api_constant/api_constants.dart';
import 'package:news/api_constant/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/source_response.dart';

/*
https://newsapi.org/v2/top-headlines/sources?
apiKey=be0fe2c614ac4c1eb2549db3f252315e
 */

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      // String => json => object
      var bodyString = response.body; // String
      var json = jsonDecode(bodyString); // json
      return SourceResponse.fromJson(json); // object
      // SourceResponse.fromJson(jsonDecode(bodyString));
    } catch (e) {
      throw e;
    }
  }

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=be0fe2c614ac4c1eb2549db3f252315e
 */

  static Future<NewsResponse?> getNewsBySourceId(
      String sourceId, int pageNumber) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'sortBy': 'publishedAt',
      'pageSize': '10',
      'page': pageNumber.toString()
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
      // NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

// static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
//   Uri url =Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,
//   {
//     'apiKey' : 'be0fe2c614ac4c1eb2549db3f252315e',
//     'sources' : 'sourceId'
//   }
//   );
//   try{
//     var response = await http.get(url);
//     var responseBody = response.body;   // String
//     var json =jsonDecode(responseBody);     // json
//     return NewsResponse.fromJson(json);   // object
//     // NewsResponse.fromJson(jsonDecode(responseBody));
//   }catch(e){
//     throw e;
//   }
//
//
// }
}
