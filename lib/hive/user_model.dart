import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String uId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
 

  UserModel(
      {required this.uId,
      required this.name,
      required this.image,
      });
}
