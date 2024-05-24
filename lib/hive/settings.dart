import 'package:hive/hive.dart';
part 'settings.g.dart';

@HiveType(typeId: 2)
class Settings extends HiveObject {


  @HiveField(1)
  bool shouldSpeak = false;

  // constructor
  Settings({
    required this.shouldSpeak,
  });
}
