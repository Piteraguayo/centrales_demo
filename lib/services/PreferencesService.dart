import 'package:startup_namer/models/PreferencesModel.dart';

abstract class PreferencesService {
  Future<PreferencesModel> getPreferences();
  Future<void> setPreferences(PreferencesModel preferences);
  Future<void> clearPreferences();
  Future<String> getPreferenceStringByKey(String key);
}