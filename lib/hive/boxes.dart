import '../constants/hive_constants.dart';
import 'chat_history.dart';
import 'settings.dart';
import 'user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  // get the caht history box
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(HiveConstants.chatHistoryBox);

  // get user box
  static Box<UserModel> getUser() => Hive.box<UserModel>(HiveConstants.userBox);

  // get settings box
  static Box<Settings> getSettings() =>
      Hive.box<Settings>(HiveConstants.settingsBox);
}
