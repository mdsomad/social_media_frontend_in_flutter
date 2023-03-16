
import 'dart:convert';

import 'package:application_authenticate_frontend_with_flutter/data/app_expositions.dart';
import 'package:application_authenticate_frontend_with_flutter/models/UserError.dart';
import 'package:application_authenticate_frontend_with_flutter/models/user_model.dart';
import 'package:application_authenticate_frontend_with_flutter/res/app_url.dart';
import 'package:application_authenticate_frontend_with_flutter/service/session_manager.dart';
import 'package:application_authenticate_frontend_with_flutter/service/user_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../Utils/Utils.dart';
import '../Utils/routes/routes_name.dart';
import '../repository/auth_repository.dart';

class AuthPageProvider with ChangeNotifier{
  
  final _myRepo = AuthRepository();    //TODO Create object AuthRepository class

  bool _loading = false;
  bool get loading => _loading;

  bool _sigUploading = false;
  bool get sigUploading => _sigUploading;

  

   //TODO Create  setLoading function
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
 
  
  
  //TODO Create setSigUpLoading function
  setSigUpLoading(bool value){
    _sigUploading = value;
    notifyListeners();
  }

  





//TODO Create loginApi Function 
  Future<void> loginApi(dynamic data,BuildContext context)async{
      setLoading(true);

     _myRepo.login(data).then((value){      //* <-- login function call
        setLoading(false);
        // print('User _id this --> ${value.userid.toString()}');
        // print('Token this --> ${value.token.toString()}');
        SessionController().userid = value.userid.toString();
        final userPreferences = Provider.of<UserSharedPreferences>(context,listen: false);

        //* Token save
        userPreferences.saveUser(
          UserModel(
            token: value.token.toString()
          )
        );



        //* UserId Save
        userPreferences.saveUserId(   
          UserModel(
            userid: value.userid.toString()
          )
        );


        Utils.toastMessage(value.message.toString());
        Navigator.pushReplacementNamed(context, RoutesName.mainpage);
       if(kDebugMode){
          print(value.toString());
       }
     }).onError((error, stackTrace){
         setLoading(false);
        //  UserError userError = UserError.fromJson(error as Map<dynamic,dynamic>);
          Utils.toastMessage(error.toString());
        
         if(kDebugMode){ 
          
          print(error.toString());
       }
     });
  }











  //TODO Create sigUpApi Function
  Future<void> sigUpApi(dynamic data,BuildContext context)async{
      setSigUpLoading(true);
     _myRepo.sigUpApi(data).then((value){      //* <-- login function call
         if(kDebugMode){
          print(value);
         }
        setSigUpLoading(false);
        final userPreferences = Provider.of<UserSharedPreferences>(context,listen: false);
        userPreferences.saveUser(
          UserModel(
            token: value['token'].toString()
          )
        );
        Utils.ftushBarErrorMessage("SigUp Successfully", context);
       // Navigator.popUntil(context, (route) => route.isFirst);  //! Not Use Error
        Navigator.pushReplacementNamed(context, RoutesName.mainpage);
       if(kDebugMode){
          print(value.toString());
       }
     }).onError((error, stackTrace){
         setSigUpLoading(false);
         if(kDebugMode){ 
          Utils.ftushBarErrorMessage(error.toString(),context);
          print(error.toString());
       }
     });
  }







  //TODO Create ChangePassword Function
  Future<void> ChangePasswordApi(String token,data,BuildContext context)async{
      setSigUpLoading(true);
     _myRepo.changepassword(token,data).then((value){      //* <-- login function call
        Utils.ftushBarErrorMessage("Change Password Successfully", context);
        setSigUpLoading(false);
       if(kDebugMode){
          print(value.toString());
       }
     }).onError((error, stackTrace){
         setSigUpLoading(false);
         if(kDebugMode){ 
          Utils.ftushBarErrorMessage(error.toString(),context);
          print(error.toString());
       }
     });
  }


  


  
}