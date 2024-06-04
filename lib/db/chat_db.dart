import 'dart:typed_data';
import 'package:hive/hive.dart';
part 'chat_db.g.dart';

@HiveType(typeId: 0)
class ChatConversation extends HiveObject {
  @HiveField(0)
  final String conversationId;

  @HiveField(1)
  final List<ChatMessage> messages;

  ChatConversation({
    required this.conversationId,
    required this.messages,
  });
}

@HiveType(typeId: 1)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final bool isUsermsg;

  @HiveField(1)
  final String? message;

  @HiveField(2)
  final Uint8List? image;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String conversationId;

  ChatMessage (
  {
    required this.isUsermsg,
    required this.message,
    required this.image,
    required this.date,
    required this.conversationId,
  });
}
