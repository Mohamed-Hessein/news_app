
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/themeing/bloc/cubit.dart';
import '../model/catgory_model.dart';

import '../screens/news_screen.dart';
import '../screens/sources_screen.dart';
import '../widget/drawer.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({super.key,});
static const routeName = '/home';
   var catgiryList = CatgoryModel.getCatList();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Function ?clicked ;

bool isRight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(catIndex == null? 'Home' : catIndex!.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),),
      backgroundColor: Color(0xFF1c1c1c),
      drawer: DrawerWidget(),
      body: catIndex == null?CatgroyScreen(clicked: onClicked,) : Newsscreen(catgroyId: catIndex!.id,),
    );
  }

  CatgoryModel ? catIndex ;

 onClicked( CatgoryModel catgory){
    catIndex = catgory;
    setState(() {

    });
}}

class CatgroyScreen extends StatelessWidget {
    Function clicked ;

   CatgroyScreen({super.key,required this.clicked});
    var catgiryList = CatgoryModel.getCatList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: ThemeCubit.get(context).baseColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [Text(  "morning_news",style: TextStyle(color:ThemeCubit.get(context).baseColors.textColors,fontSize: 14,fontWeight: FontWeight.w500),).tr(),
              SizedBox(height: 15,),
              SizedBox(

                child: ListView.separated(
shrinkWrap:true,
                  separatorBuilder: (context,i){
                    return SizedBox(height: 15,);
                  },

                  itemBuilder: (context,index){

                    return GestureDetector(
                      onTap: (){

                        clicked(catgiryList[index]);

                      },
                      child: Container(
padding: EdgeInsets.symmetric(horizontal: 2,vertical: 8),
                        decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: ThemeCubit.get(context).baseColors.textColors,)),borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset( ThemeCubit.get(context).baseColors.background == Colors.white?catgiryList[index].labelDark: catgiryList[index].label ,fit: BoxFit.cover,)),
                            Padding(
                              padding:      index.isEven? EdgeInsets.only(left: 80.0,top: 30): EdgeInsets.only(right: 80.0,top: 30),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(textAlign: TextAlign.end,'${catgiryList[index].name}',style: TextStyle(fontSize: 25,color:ThemeCubit.get(context).baseColors.postiveColors,fontWeight: FontWeight.bold),)),
                            ),
                            Visibility(
                                visible: index.isEven?
                                true: false,

                                child:      Positioned(
                                  top: 130,
                                  left: 180,
                                  child: Align(alignment: Alignment.bottomRight,child: Container(
                                    decoration: BoxDecoration( color: Color.fromRGBO(0, 0, 0, 0.5),borderRadius: BorderRadius.circular(30)),

                                    width: 169,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: Text('View All',style: TextStyle(fontSize: 20,color: Colors.white),),
                                        ),
                                        Image.asset('assets/images/view_all_btn.png',width: 50,height: 50,),
                                      ],
                                    ),),),
                                ) )
                            ,
                            Visibility(
                                visible: index.isOdd?
                                true: false,

                                child:      Positioned(
                                  top: 130,
                                  right: 180,
                                  child: Align(alignment: Alignment.bottomRight,child: Container(
                                    decoration: BoxDecoration( color: Color.fromRGBO(0, 0, 0, 0.5),borderRadius: BorderRadius.circular(30)),

                                    width: 169,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [      Image.asset('assets/images/arrow_right.png',width: 50,height: 50,),

                                        Padding(
                                          padding: const EdgeInsets.only(right: 16.0),
                                          child: Text('View All',style: TextStyle(fontSize: 20,color: Colors.white),),
                                        ),

                                      ],
                                    ),),),
                                ) )

                          ],
                        ),),
                    );
                  }, itemCount: catgiryList.length,
                ),
              )

            ],),
          ),
        ),
      ),
      drawer: DrawerWidget(),


    );
  }
}
