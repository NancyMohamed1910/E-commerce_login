import 'package:shared_preferences/shared_preferences.dart';

class PreferenceSrevice {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      //print('init prefernce');
    } catch (e) {
      print('>>>>> error in configration of preference $e <<<<<<');
    }
  }

  ///---------note using get to encapsulate _prefs to be sure that only preference will be created
  static SharedPreferences? get prefs => _prefs;

  //--we can write get
  /*
  static SharedPreferences? get() {
    return _prefs;
  }
  */
  static Future<void> set(String user, String password, bool islogin) async {
    await _prefs?.setString('User', user);
    await _prefs?.setString('Password', password);
    await _prefs?.setBool('isLogin', true);
    //print('hi from set');
  }
}
