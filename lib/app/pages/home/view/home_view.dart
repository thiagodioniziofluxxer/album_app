import 'package:album_app/app/models/user_model.dart';

abstract interface class HomeView {
  void getData();
  void error(String message);
  void logout();
  void showLoader();
  void updateUser(UserModel user);
}
