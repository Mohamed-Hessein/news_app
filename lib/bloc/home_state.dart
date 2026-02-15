class HomeState {}
class HomeinitalState extends HomeState{}
class ChangeTab extends HomeState{}

class SourcesLoadingState extends HomeState{}
class SourcesScuessState extends HomeState{}
class SourcesErrorState extends HomeState{}



class NewsLoadingState extends HomeState{}
class NewsScuessState extends HomeState{}
class NewsErrorState extends HomeState{
  String message;
  NewsErrorState(this.message);

}

