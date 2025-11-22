import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static Future<void> load() async {
    if (kDebugMode) {
      try {
        await dotenv.load(fileName: ".env");
      } catch (e) {
        print(e);
      }
    }
  }

  static String get supabaseAPI =>
      kDebugMode ? dotenv.env['SUPABASE_API'] ?? '' : const String.fromEnvironment('SUPABASE_API');

  static String get supabaseURL =>
      kDebugMode ? dotenv.env['SUPABASE_URL'] ?? '' : const String.fromEnvironment('SUPABASE_URL');

  //todo should be removed and a real auth system should be implemented
  static String get tempPassword =>
      kDebugMode ? dotenv.env['TEMP_PASS'] ?? '' : const String.fromEnvironment('TEMP_PASS');
}
