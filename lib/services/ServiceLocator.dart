import 'UserService.dart';
import 'UserServiceWebAPI.dart';
import 'UserServiceFirebase.dart';
import 'PreferencesService.dart';
import 'PreferencesServiceDevice.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;

setupServiceLocator() {
  //dependencies injection
  getIt.registerLazySingleton<UserService>(() => UserServiceFirebase());
  getIt.registerLazySingleton<PreferencesService>(() => PreferencesServiceDevice());
}
