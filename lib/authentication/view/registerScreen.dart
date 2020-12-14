import 'package:firechat/utility/widgets/lightTextField.dart';
import 'package:firechat/utility/widgets/wideRedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  controller: emailController
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: WideRedButton(label: 'Register', onPressed: (){

                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
