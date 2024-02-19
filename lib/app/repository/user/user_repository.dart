import 'package:album_app/app/models/user_model.dart';

abstract interface class UserRepository {
Future<UserModel> me();
}