import 'package:firechat/authentication/repository/authenticationRepo.dart';
import 'package:firechat/user/view/homeScreen.dart';
import 'package:firechat/utility/widgets/lightTextField.dart';
import 'package:firechat/utility/widgets/screenLoader.dart';
import 'package:firechat/utility/widgets/wideRedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return IsScreenLoading(
      isLoading: loading,
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.green,
                    onPressed: (){
                      Get.back();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                FlutterLogo(size: 200,),
                SizedBox(height: 20,),
                LightTextField(
                    hintText: 'User Name',
                    controller: userNameController
                ),
                SizedBox(height: 20,),
                LightTextField(
                    hintText: 'Email Address',
                    controller: emailController
                ),
                SizedBox(height: 20,),
                LightTextField(
                    hintText: 'Password',
                    controller: passwordController
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: WideRedButton(label: 'Register', onPressed: () async{
                    if(
                      userNameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty
                    ){
                      setState(() {
                        loading = true;
                      });
                      bool result = await RepoAuth.registerUser(userNameController.text, emailController.text, passwordController.text);
                      setState(() {
                        loading = false;
                      });
                      if(result){
                        Get.offAll(HomeScreen());
                      }else{
                        Get.rawSnackbar(
                          title: 'Error',
                          message: 'Failed to create user'
                        );
                      }

                    }else{
                      Get.rawSnackbar(
                        title: 'Error',
                        message: 'Please fill up all the fields'
                      );
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
