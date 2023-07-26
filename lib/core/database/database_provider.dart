import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'database_provider.g.dart';

@riverpod
Future<SharedPreferences> database(DatabaseRef ref) async {
  return SharedPreferences.getInstance();
}