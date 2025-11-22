class AppLog {
  final String id;
  final String userId;
  final String displayName;
  final String role;
  final String action;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;

  AppLog({
    required this.id,
    required this.userId,
    required this.displayName,
    required this.role,
    required this.action,
    required this.metadata,
    required this.createdAt,
  });

  factory AppLog.fromJSON(Map<String, dynamic> map) {
    return AppLog(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      displayName: map['display_name'] as String,
      role: map['role'] as String,
      action: map['action'] as String,
      metadata: Map<String, dynamic>.from(map['metadata'] as Map),
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'user_id': userId,
      'display_name': displayName,
      'role': role.toString().split('.').last,
      'action': action,
      'metadata': metadata,
      'created_at': createdAt.toIso8601String(),
    };
  }

  AppLog copyWith({
    String? id,
    String? userId,
    String? displayName,
    String? role,
    String? action,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) {
    return AppLog(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      action: action ?? this.action,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
