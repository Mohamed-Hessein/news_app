// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../bloc/home_cubit.dart' as _i954;
import '../screens/repo/Home_local.dart' as _i1024;
import '../screens/repo/Home_remote_repo.dart' as _i647;
import '../screens/repo/home_repo_local.dart' as _i800;
import '../screens/repo/home_repo_remote.dart' as _i681;
import 'api_manger.dart' as _i715;
import 'intrnet_cheker.dart' as _i291;
import 'themeing/bloc/cubit.dart' as _i99;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i99.ThemeCubit>(() => _i99.ThemeCubit());
    gh.singleton<_i291.InternetConnectivity>(
      () => _i291.InternetConnectivity(),
    );
    gh.lazySingleton<_i715.ApiManger>(() => _i715.ApiManger());
    gh.factory<_i800.HomeRepoLocal>(() => _i1024.HomeLocal());
    gh.factory<_i647.HomeRemoteRepo>(
      () => _i681.HomeRepoRemoteImple(gh<_i715.ApiManger>()),
    );
    gh.factory<_i954.HomeCubit>(
      () => _i954.HomeCubit(
        gh<_i647.HomeRemoteRepo>(),
        gh<_i800.HomeRepoLocal>(),
      ),
    );
    return this;
  }
}
