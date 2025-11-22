import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseModule {
  SupabaseClient get client => Supabase.instance.client;
}
