import 'package:get/get.dart';

class LoginPageController extends GetxController {
  bool isVisible = true;

  String? erroRText;
  String? erroRTextPass;

  void isPassVisible() {
    isVisible = !isVisible;
    update(); 
  }

  void onStringChanged(String values) { 
    if (values.isEmpty) {
      erroRText = null;
      //  update();
    } else if (values.length > 10) {
      erroRText = "Mobile Number Must Conation 10 Char";
      //  update();
    } else if (values.length < 10){
  erroRText = "Mobile Number Must Conation 10 Char";

    }else if (values.length == 10){

erroRText = null; 
    }

    update();
  }



  void onPassWordValidation(String value){

if(value.isEmpty){ 
erroRTextPass = null;

}else if(value.length < 5){

  erroRTextPass = 'Password must contain 5 elemnts';
}else{

  erroRTextPass = null; 
}
update(); 
  }
}
