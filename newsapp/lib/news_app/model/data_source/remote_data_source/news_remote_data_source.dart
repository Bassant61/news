import 'package:dio/dio.dart';
import 'package:newsapp/news_app/core/network/dio_helper.dart';
import 'package:newsapp/news_app/core/network/end_points.dart';
import 'package:newsapp/news_app/model/models/news_artical_model.dart';


class NewsRemoteDataSource{
  Future<List<NewsArticalModel>> getNews({required String category})async{
    try{
      final Response response = await DioHelper.getData(endPointPath: 
      EndPoints.topHotlines,
      queryParameters: {
        "Category":category,
        "apiKey":"06121a87c4994ffc8f750b69e0d9b842"
      }
      );
      return List<NewsArticalModel>.from(
        response.data['articles'].map((item)=>NewsArticalModel.fromMap(item))
      );
    }
    catch(error){
      rethrow;
    }
  }
}