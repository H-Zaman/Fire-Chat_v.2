import 'package:firechat/authentication/repository/authenticationRepo.dart';
import 'package:firechat/user/model/userModel.dart';
import 'package:firechat/user/repository/homeScreenRepo.dart';
import 'package:firechat/user/view_model/viewModelUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome : ${ViewModelUser.user.value.userName}'
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: RepoAuth.logoutUser),
          IconButton(icon: Icon(Icons.api), onPressed: () async{
            await RepoHome.userList();
            print(ViewModelUser.userList.length);
          })
        ],
      ),
      body: Obx(()=>ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: ViewModelUser.userList.length,
        itemBuilder: (_, index){
          UserModel user = ViewModelUser.userList[index];
          return ListTile(
            title: Text(user.userName),
          );
        },
      ))
    );
  }
}
