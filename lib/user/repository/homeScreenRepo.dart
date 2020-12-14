import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/user/model/userModel.dart';
import 'package:firechat/user/view_model/viewModelUser.dart';

class RepoHome{
  static final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  static userList() async{
    userCollection.snapshots().listen((event) {
      ViewModelUser.userList.clear();
      event.docs.forEach((element) {
        ViewModelUser.userList.add(UserModel.fromJson(element.data()));
      });
    });
  }
}