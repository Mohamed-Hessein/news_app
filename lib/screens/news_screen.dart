import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/bloc/home_cubit.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/bloc/home_state.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/screens/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/api_manger.dart';
import '../core/themeing/bloc/cubit.dart';
import '../model/news_model.dart';

class NewsScreen extends StatefulWidget {
  Function? clicked ;
   NewsScreen({super.key,  this.clicked});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
late  WebViewController controller ;


  List<bool> isClicked = [];

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController();
  }
  Widget build(BuildContext context) {

    return   BlocConsumer<HomeCubit, HomeState>(builder: (context,state){
      var bloc = context.watch<HomeCubit>();

      if (state is NewsErrorState) {
        return Center(child: Text("Something went wrong"));
      }

      if (bloc.newsData.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      if(state is NewsLoadingState){
        return Center(child: CircularProgressIndicator());
      }else {   return SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: bloc.newsData.length, itemBuilder: (BuildContext context, int index) {

          var newsData = bloc.newsData[index];
        if (isClicked.length != bloc.newsData.length) {
          isClicked = List.filled(bloc.newsData.length, false);
        }
        return  GestureDetector(
          onLongPress: (){
            isClicked[index] =!isClicked[index];
           if(isClicked[index] ==true){
             Timer(Duration(seconds: 1), (){
               isClicked[index]  = false;
             });
           }
            setState(() {

            });

          },
          child: isClicked[index]? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.fromBorderSide(BorderSide(color: ThemeCubit.get(context).baseColors.textColors,width: 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(children: [ClipRRect(borderRadius: BorderRadius.circular(20),child: CachedNetworkImage(
                  imageUrl: '${newsData.urlToImage}',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),SizedBox(height: 15,), Text('${newsData.description}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color:ThemeCubit.get(context).baseColors.background == Colors.white?ThemeCubit.get(context).baseColors.textColors:  ThemeCubit.get(context).baseColors.postiveColors,),)
                  ,SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('${newsData.author}',style: TextStyle(color: Colors.black,fontSize: 12),)                   , Text('${newsData.publishedAt!.substring(0,10)}',style: TextStyle(color: Colors.grey,fontSize: 12),)  ],)
                  ,SizedBox(height: 15,),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                        style:ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))) ,


                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ArticleWebViewScreen(
                                  url: newsData.url ?? '',
                                ),
                              ),
                            );
                          },

                         child: Center(child: Text('View Full Articel',style: TextStyle(fontSize: 20,color: Colors.white),),)),
                  )
                ],),
              ),),
          ): Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.fromBorderSide(BorderSide(color: ThemeCubit.get(context).baseColors.textColors,width: 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(children: [ClipRRect(borderRadius: BorderRadius.circular(20),child: CachedNetworkImage(
                  imageUrl: '${newsData.urlToImage}',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),SizedBox(height: 15,), Text('${newsData.description}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: ThemeCubit.get(context).baseColors.textColors,),)
                  ,SizedBox(height: 15,)
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('${newsData.author}',style: TextStyle(color: Colors.grey,fontSize: 12),)                   , Text('${newsData.publishedAt!.substring(0,10)}',style: TextStyle(color: Colors.grey,fontSize: 12),)  ],)
                ],),
              ),),
          ),
        );},
        ),
      );}

    }, listener: (context, state){
      if(state is NewsErrorState){
         Center(child: Text(e.toString()),);
      }
    });

  }

}
