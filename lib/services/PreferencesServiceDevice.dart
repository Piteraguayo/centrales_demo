import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_namer/models/PreferencesModel.dart';
import 'package:startup_namer/services/PreferencesService.dart';

class PreferencesServiceDevice extends PreferencesService {
  @override
  Future<PreferencesModel> getPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';
    String token = prefs.getString('token') ?? '';

    return PreferencesModel(userId, token);
  }

  @override
  Future<void> setPreferences(PreferencesModel preferences) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', preferences.userId);
    prefs.setString('token', preferences.token);
  }

  @override
  Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Future<String> getPreferenceStringByKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String prefValue = prefs.getString(key) ?? '';

    return prefValue;
  }
}