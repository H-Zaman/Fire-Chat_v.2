import 'package:firechat/authentication/repository/authenticationRepo.dart';
import 'package:firechat/authentication/view/registerScreen.dart';
import 'package:firechat/user/view/homeScreen.dart';
import 'package:firechat/utility/widgets/lightTextField.dart';
import 'package:firechat/utility/widgets/screenLoader.dart';
import 'package:firechat/utility/widgets/wideRedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: 'test1@gmail.com');

  final TextEditingController passwordController = TextEditingController(text: '123qwe');

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return IsScreenLoading(
      isLoading: loading,
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.green,
                  onPressed: (){
                    Get.to(RegisterScreen());
                  },
                  child: Text(
                  'Register',
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
                  child: WideRedButton(label: 'Login', onPressed: () async{
                    if(
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty
                    ){
                      setState(() {
                        loading = true;
                      });
                      bool result = await RepoAuth.loginUser(emailController.text, passwordController.text);
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
