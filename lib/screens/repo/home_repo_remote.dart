import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/cach_helping.dart';

import '../../core/api_manger.dart';
import '../../model/news_model.dart';
import '../../model/sources_model.dart';

import 'Home_remote_repo.dart';
@Injectable(as: HomeRemoteRepo )
class HomeRepoRemoteImple extends HomeRemoteRepo {
ApiManger apiMAnger;
HomeRepoRemoteImple(this.apiMAnger);

  @override
 Future<newsResponse> getNews(String sourceId)async {
    // TODO: implement getNews
 try{     Response response = await apiMAnger.get(
   "/v2/everything",
   queryParameters: {"sources": sourceId},
 );newsResponse news = newsResponse.fromJson(response.data);
 await CacheHelper.saveNewsResponse( news, sourceId);
   return news;
 }catch(e){
   throw Exception(e.toString());

 }
  }

  @override
  Future<soucresResponse> getSourser(String catgroy)async {
    // TODO: implement getSourser

   try{
     Response response = await apiMAnger.get(
       "/v2/top-headlines/sources",
       queryParameters: {"category": catgroy},
     );

     soucresResponse source = soucresResponse.fromJson(response.data);
     await CacheHelper.saveSourceResponse(source, catgroy);

     return source;
   }catch(e){
print('jlfghwhiy46u569u5');
     throw Exception(e.toString());
   }
  }
}