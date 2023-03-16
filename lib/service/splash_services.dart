import 'package:application_authenticate_frontend_with_flutter/Utils/routes/routes_name.dart';
import 'package:application_authenticate_frontend_with_flutter/service/user_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


import '../models/user_model.dart';


class SplashServices {

 Future<UserModel> getUsertData() => UserSharedPreferences().getUser();   //* <-- Yah hai SharedPreferences ko Function ko get karna ka tarika



 void checkAuthentictation(BuildContext context)async{

 //* call getUser Function
  getUsertData().then((value){

    debugPrint(value.token.toString());
    
    if(value.token.toString() == 'null' || value.token.toString() == ''){
      Future.delayed(Duration(seconds: 5));
      Navigator.pushReplacementNamed(context, RoutesName.login);
    }else{
       Future.delayed(Duration(seconds: 5));
       Navigator.pushReplacementNamed(context, RoutesName.mainpage);
     
    }

  }).onError((error, stackTrace){
     if(kDebugMode){
      print(error);
     }
  });
  
 }
  
  
}