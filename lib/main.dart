import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/cach_helping.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/intrnet_cheker.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/bloc/cubit.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/bloc/theme_state.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/articles_adabter.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/news_adabpter.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/source_adapter.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/soures_res_adabter.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/screens/sources_screen.dart';

import 'core/di.dart';
import 'core/observer.dart';
import 'home/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(SourcesResponseAdapter());
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());

  configureDependencies();
  Bloc.observer = MyBlocObserver();

  getIt<InternetConnectivity>().initialize();

  runApp( EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'us'),
      child:   MyApp(),

  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => getIt<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context , state) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            Newsscreen.routeName: (context) => Newsscreen(),
          },
         );
            } ),
      );
  }}

