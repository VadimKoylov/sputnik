import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:sputnik/core/di/injector.config.dart';

const platformMobile = Environment('platformMobile');

GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void injectDependencies(
    {required String env, EnvironmentFilter? environmentFilter}) {
  getIt.init(environment: env, environmentFilter: environmentFilter);
}
