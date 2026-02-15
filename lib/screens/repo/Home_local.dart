import 'package:injectable/injectable.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/cach_helping.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/sources_model.dart';

import '../../model/news_model.dart';
import 'home_repo_local.dart';

@Injectable(as: HomeRepoLocal)
class HomeLocal extends HomeRepoLocal {
  @override
  Future<newsResponse>getNews(String sourceId)async {
  var news =await CacheHelper.getNewsResponse(sourceId);
return news ?? newsResponse();
  }

  @override
 Future<soucresResponse> getSourser(String catgroy)async{
    var res = await CacheHelper.getSourceResponse(catgroy);
    return res ?? soucresResponse();
  }
}