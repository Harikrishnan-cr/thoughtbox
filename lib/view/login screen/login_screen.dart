// ignore_for_file: must_be_immutable

import 'package:datas/controller/login_controller.dart';
import 'package:datas/view/home_screen/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final phoneNumberController = TextEditingController();
  final passWordController = TextEditingController();
  final lableTitle = 'Mobile Number';
  final erroText = 'Invalid Phone Number';
  final loginController = Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginPageController>(builder: (loginControllers) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormFeildWidget(
                textController: phoneNumberController,
                erroText: loginController.erroRText,
                lableTitle: lableTitle),
            const SizedBox(
              height: 20,
            ),
            TextFormFeildPassWordWidget(
                textController: passWordController,
                erroText: loginControllers.erroRTextPass,
                lableTitle: 'Password'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  Get.off(()=>const BottomBarScreen());   
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class TextFormFeildWidget extends StatelessWidget {
  TextFormFeildWidget({
    Key? key,
    required this.textController,
    this.erroText,
    required this.lableTitle,
  }) : super(key: key);

  final TextEditingController textController;
  String? erroText;
  final String lableTitle;

  bool? isPassVisible;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(builder: (loginPageController) {
      return TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          loginPageController.onStringChanged(value);
        },
        controller: textController,
        decoration: InputDecoration(
            errorText: erroText,
            label: Text(lableTitle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(150))),
      );
    });
  }
}

class TextFormFeildPassWordWidget extends StatelessWidget {
  TextFormFeildPassWordWidget({
    Key? key,
    required this.textController,
    this.erroText,
    required this.lableTitle,
    this.isPassVisible,
  }) : super(key: key);

  final TextEditingController textController;
  String? erroText;
  final String lableTitle;

  bool? isPassVisible;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(builder: (loginPageController) {
      return TextFormField(
        onChanged: (value) {
          loginPageController.onPassWordValidation(value);
        },
        obscureText: loginPageController.isVisible,
        controller: textController,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  loginPageController.isPassVisible();
                },
                child: loginPageController.isVisible != true
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off)),
            errorText: loginPageController.erroRTextPass,
            label: Text(lableTitle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(150))),
      );
    });
  }
}
