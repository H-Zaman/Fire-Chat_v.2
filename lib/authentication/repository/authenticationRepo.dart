import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/authentication/view/loginScreen.dart';
import 'package:firechat/user/model/userModel.dart';
import 'package:firechat/user/view_model/viewModelUser.dart';
import 'package:get/get.dart';

class RepoAuth{
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  static registerUser(String userName, String email, String password) async{

   try{
     /// Registering user with email and password
     UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

     /// creating user doc
     await userCollection.doc(credential.user.uid).set({
       'userName' : userName
     });
     DocumentSnapshot userData = await userCollection.doc(credential.user.uid).get();
     ViewModelUser.user.value = UserModel.fromJson(userData.data());
     return true;
   }catch(e){
     print(e.toString());
     return false;
   }
  }

  static loginUser(String email, String password) async{
    try{
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot userData = await userCollection.doc(credential.user.uid).get();
      ViewModelUser.user.value = UserModel.fromJson(userData.data());
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }


  static logoutUser(){
    firebaseAuth.signOut();
    Get.offAll(LoginScreen());
  }
}