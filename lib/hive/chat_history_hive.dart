import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final bool isUser;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final DateTime timestamp;

  ChatMessage({
    required this.isUser,
    required this.message,
    required this.timestamp,
  });
}
