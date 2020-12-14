import 'package:firechat/user/model/userModel.dart';
import 'package:get/get.dart';

class ViewModelUser{
  static var user = UserModel().obs;
  static var userList = <UserModel>[].obs;
}