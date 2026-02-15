import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/home/home_screen.dart';

import '../core/themeing/bloc/cubit.dart';
import '../core/themeing/dark_theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: ThemeCubit.get(context).baseColors.postiveColors,child: Column(
      children: [
        SizedBox(
            height: 250,
            child: DrawerHeader(decoration: BoxDecoration(color: ThemeCubit.get(context).baseColors.textColors,),child: SizedBox(
                height: 150,

                child: Center(child: Text('News App',style: TextStyle(color: ThemeCubit.get(context).baseColors.postiveColors),))),)),
        ListTile(leading: ImageIcon(AssetImage('assets/images/Home 1.png'),color: Colors.white,),title: GestureDetector(

            onTap: (){
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: Text(    "go_to_home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:        ThemeCubit.get(context).baseColors.textColors),).tr()),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(color: ThemeCubit.get(context).baseColors.textColors,thickness: 2,height: 2,),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color:ThemeCubit.get(context).baseColors.textColors),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButtonHideUnderline(

              child: DropdownButton<String>(
                hint: Text('English',style: TextStyle(color: ThemeCubit.get(context).baseColors.textColors),),

                value: context.locale.languageCode,
                isExpanded: true,
                dropdownColor: Colors.black,
                icon:  Icon(Icons.keyboard_arrow_down, color: ThemeCubit.get(context).baseColors.textColors),
                style:  TextStyle(color: ThemeCubit.get(context).baseColors.textColors, fontSize: 18),
                items: const [
                  DropdownMenuItem(
                    value: 'en',

                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('العربية'),
                  ),
                ],
                onChanged: (value) {
                  context.setLocale(Locale(value!,value == 'ar'?  'EG': 'US'));
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: ThemeCubit.get(context).baseColors.textColors),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButtonHideUnderline(

              child: DropdownButton<String>(
                hint: Text('Dark',style: TextStyle(color: ThemeCubit.get(context).baseColors.textColors),),

                value:   ThemeCubit.get(context).isDark ? 'dark' : 'light',

              isExpanded: true,
                dropdownColor: Colors.black,
                icon:  Icon(Icons.keyboard_arrow_down, color: ThemeCubit.get(context).baseColors.textColors),
                style:  TextStyle(color: ThemeCubit.get(context).baseColors.textColors, fontSize: 18),
                items: [
                  DropdownMenuItem(value: 'dark',



                    child: Text('Drak Mode',style: TextStyle(color: ThemeCubit.get(context).baseColors.textColors)
                      ,),
                  ),
                  DropdownMenuItem(
                    value: 'light',
                   child: Text('Light Mode',style: TextStyle(color: ThemeCubit.get(context).baseColors.textColors),),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ThemeCubit.get(context).ChangeTheme();
                    Navigator.pop(context);
                  }   },
              ),
            ),
          ),
        )



      ],
    ),);
  }
}