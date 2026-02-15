import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../core/constants.dart';
import '../core/intrnet_cheker.dart';
import '../model/news_model.dart' show newsResponse, Articles;
import '../model/sources_model.dart';
import '../screens/repo/Home_remote_repo.dart';
import '../screens/repo/home_repo_local.dart';
import 'home_state.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {HomeRemoteRepo repo;
HomeRepoLocal repoLocal;
  HomeCubit(this.repo, this.repoLocal): super(HomeinitalState());
  Dio dio = Dio();
  List<Sources> sources =[];
  List<Articles> newsData =[];

  int selectedIndex = 0;
  changeTab(index){
    selectedIndex = index;
    getNewsData();

  }
  Future<void> getSources(String catgroy)async{
emit(SourcesLoadingState());
try{


  soucresResponse source = InternetConnectivity().isConnected ?await repo.getSourser(catgroy) : await repoLocal.getSourser(catgroy);
  sources =source.sources!;
  print( InternetConnectivity().isConnected);
  emit(SourcesScuessState());
  getNewsData();
}catch(e){
print((e.toString()));
  emit(SourcesErrorState());
}

  }

 Future<void> getNewsData()async{
    emit(NewsLoadingState());
    try{     newsResponse news =  InternetConnectivity().isConnected?await repo.getNews(sources[selectedIndex].id ??'') : await repoLocal.getNews(sources[selectedIndex].id ??'');
  newsData =  news.articles! ;
  print( InternetConnectivity().isConnected)
        ;
emit(NewsScuessState());
    }catch(e){
      emit(NewsErrorState(e.toString()));
    }

  }
}