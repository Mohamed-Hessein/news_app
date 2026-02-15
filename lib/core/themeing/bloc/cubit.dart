import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/bloc/theme_state.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/colors.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/dark_theme.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/themeing/light_theme.dart';
@injectable
class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit(): super(initalThemState());

  static ThemeCubit get(context) => BlocProvider.of(context);
  ThemeColos baseColors = LightTheme();
  bool isDark = false;

 void ChangeTheme(){
if(baseColors is LightTheme){
  baseColors = DarkTheme();
}else {
  baseColors = LightTheme();
}
emit(ChangeThemeState());
  }
}