
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserSharedPreferences with ChangeNotifier{






 //TODO User Save Token Function Create
  Future<bool> saveUser( UserModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
     notifyListeners();
     return true;
  }
  







  //TODO User Get Token Function Create
  Future<UserModel> getUser()async{
   final SharedPreferences _sp = await SharedPreferences.getInstance();
   final String? token = _sp.getString('token');
      notifyListeners();
      return UserModel(
        token: token.toString()
      );
  }






  

 //TODO User Save Token Function Create
  Future<bool> saveUserId( UserModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('userid', user.userid.toString());
     notifyListeners();
     return true;
  }
  





  //TODO User Get Token Function Create
  Future<UserModel> getUserId()async{
   final SharedPreferences _sp = await SharedPreferences.getInstance();
   final String? userid = _sp.getString('userid');
      notifyListeners();
      return UserModel(
        userid: userid.toString()
      );
  }
  




   remove()async{
    final SharedPreferences _sp = await SharedPreferences.getInstance();
    // sp.clear();
    _sp.remove('token');

  }
  

   removeUserid()async{
    final SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.remove('userid');

  }







  
}