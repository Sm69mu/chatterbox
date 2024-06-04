// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatConversationAdapter extends TypeAdapter<ChatConversation> {
  @override
  final int typeId = 0;

  @override
  ChatConversation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatConversation(
      conversationId: fields[0] as String,
      messages: (fields[1] as List).cast<ChatMessage>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatConversation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.conversationId)
      ..writeByte(1)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatConversationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChatMessageAdapter extends TypeAdapter<ChatMessage> {
  @override
  final int typeId = 1;

  @override
  ChatMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessage(
      isUsermsg: fields[0] as bool,
      message: fields[1] as String?,
      image: fields[2] as Uint8List?,
      date: fields[3] as DateTime,
      conversationId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChatMessage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isUsermsg)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.conversationId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
