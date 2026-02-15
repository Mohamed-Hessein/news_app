import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/bloc/home_cubit.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/api_manger.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/di.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/bloc/cubit.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/sources_model.dart' hide Articles;

import '../bloc/home_state.dart';
import '../model/news_model.dart';
import '../widget/drawer.dart';
import 'news_screen.dart';

class Newsscreen extends StatefulWidget {
String ?catgroyId;
   Newsscreen({  super.key,  this.catgroyId});
static const routeName = '/news';

  @override
  State<Newsscreen> createState() => _NewsscreenState();
}

class _NewsscreenState extends State<Newsscreen> {
int selectedIndex =0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: BlocProvider(create: (context) =>  getIt<HomeCubit>()..getSources(widget.catgroyId
!),
child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state){
  var bloc = BlocProvider.of<HomeCubit>(context);   if (bloc.sources.isEmpty) {
    return Center(child: CircularProgressIndicator());
  }


  var sources = bloc.sources[bloc.selectedIndex];
  return Column(
    children: [
    DefaultTabController(length: bloc.sources.length,

    child: TabBar(
    tabAlignment: TabAlignment.start
    ,dividerColor: Colors.transparent,
    indicatorColor:ThemeCubit.get(context).baseColors.textColors, // لون الخط
    indicatorWeight: 3,



    onTap: (i){
      bloc.changeTab(i);
    },
    isScrollable: true,
    tabs: bloc.sources.map((e)=>Tab(child: Text('${e.name}',style: TextStyle(color:ThemeCubit.get(context).baseColors.textColors),),)).toList())),


    Expanded(child: NewsScreen()),
    ],
    );}),),
    backgroundColor: ThemeCubit.get(context).baseColors.background,
);
  }
}
