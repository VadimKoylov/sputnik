// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/followers/store/followers_store.dart' as _i4;
import '../../features/home/store/home_store.dart' as _i5;
import '../../features/sign_in/store/sign_in_store.dart' as _i6;
import '../http/api_provider.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i3.ApiProvider>(_i3.ApiProvider());
    gh.singleton<_i4.FollowersStore>(
        _i4.FollowersStore(get<_i3.ApiProvider>()));
    gh.singleton<_i5.HomeStore>(_i5.HomeStore(get<_i3.ApiProvider>()));
    gh.singleton<_i6.SignInStore>(_i6.SignInStore(get<_i3.ApiProvider>()));
    return this;
  }
}
