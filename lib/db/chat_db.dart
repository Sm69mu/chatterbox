import 'dart:typed_data';
import 'package:hive/hive.dart';
part 'chat_db.g.dart';

   @HiveType(typeId: 0)
   class ChatMessage extends HiveObject {
     @HiveField(0)
     final bool isUser;

     @HiveField(1)
     final String? message;

     @HiveField(2)
     final Uint8List? image;

     @HiveField(3)
     final DateTime date;

     ChatMessage({
       required this.isUser,
       required this.message,
       required this.image,
       required this.date,
     });
   }