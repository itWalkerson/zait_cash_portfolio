import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utils/logger.dart';
import 'app_log.dart';

const kLogsTableName = 'logs';

class LogsService with LogStaticMixin {
  static void log(String action, {Map<String, dynamic>? metadata}) async {
    try {
      final supabase = Supabase.instance.client;
      final currentUser = supabase.auth.currentUser;

      if (currentUser == null) {
        LogStaticMixin.logError('No authenticated user found. Skipping log entry creation.');
        return;
      }

      final log = AppLog(
        id: '',
        userId: currentUser.id,
        displayName: currentUser.userMetadata?['display_name'] ?? 'Unknown',
        role: currentUser.userMetadata?['role'] ?? 'Unknown',
        action: action,
        metadata: metadata,
        createdAt: DateTime.now(),
      );

      await supabase.from(kLogsTableName).insert(log.toJSON());
    } catch (e) {
      LogStaticMixin.logError('Failed to log action: $action', [e.toString()]);
    }
  }
}
