import '../../model/news_model.dart';
import '../../model/sources_model.dart';

abstract class HomeRemoteRepo {

  Future<soucresResponse>getSourser(String catgroy);
  Future<newsResponse> getNews(String sourceId);


}