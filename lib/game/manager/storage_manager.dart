import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKeys { isEffectMuted, isBgmMuted }

class StorageManager {
  final SharedPreferences prefs;

  StorageManager({required this.prefs});

  void setIsEffectMuted(bool muteState) async {
    await prefs.setBool(PrefsKeys.isEffectMuted.name, muteState);
  }

  void setIsBgmMuted(bool muteState) async {
    await prefs.setBool(PrefsKeys.isBgmMuted.name, muteState);
  }

  /// if no data with the key then return null
  bool? get getIsEffectMuted => prefs.getBool(PrefsKeys.isEffectMuted.name);

  /// if no data with the key then return null
  bool? get getIsBgmMuted => prefs.getBool(PrefsKeys.isBgmMuted.name);
}

// await prefs.remove('counter');
