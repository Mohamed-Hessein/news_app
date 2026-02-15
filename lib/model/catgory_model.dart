import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/bloc/cubit.dart';

class CatgoryModel {
  String label; String labelDark;

  String id; String name;
  CatgoryModel({required this.id, required this.name, required this.label, required this.labelDark});
  static List<CatgoryModel> getCatList(){

    return [    CatgoryModel(name: 'general',label: 'assets/images/general.png',labelDark: 'assets/images/general_dark.png',id: 'general' ),
      CatgoryModel(name: 'busniess',label:  'assets/images/busniess.png',labelDark: 'assets/images/busniess_dark.png',id: 'business' ),
      CatgoryModel(name: 'health',label:  'assets/images/helth.png',labelDark: 'assets/images/helth_dark.png',id: 'health' ),
      CatgoryModel(name: 'science',label: 'assets/images/science.png',labelDark:  'assets/images/science_dark.png',id: 'science' ),
      CatgoryModel(name: 'sport',label:  'assets/images/sport.png',labelDark: 'assets/images/sport_dark.png',id: 'sports' ),
      CatgoryModel(name: 'technology',label:  'assets/images/technology.png',labelDark: 'assets/images/technology_dark.png',id: 'technology' ),
      CatgoryModel(name: 'entertainment',label:   'assets/images/entertainment.png',labelDark: 'assets/images/entertainment_dark.png',id: 'entertainment' ),

    ];

  }

}
//List<String> catgoryName =['general','technology','sport','helth','science','busniess','entertainment',];
//
//
//    List<String> catgoryImages =['general','technology','sport','helth','science','busniess','entertainment',];