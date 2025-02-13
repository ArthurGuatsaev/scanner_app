import 'package:shared_preferences/shared_preferences.dart';

class DatabaseRepository {
  Future<void> saveOpenCount(int count) async {
    (await SharedPreferences.getInstance()).setInt('open_count', count);
  }

  Future<int> getOpenCount() async {
    return (await SharedPreferences.getInstance()).getInt('open_count') ?? 1;
  }
}
