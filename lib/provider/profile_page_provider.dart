
import 'dart:async';

import 'package:application_authenticate_frontend_with_flutter/Utils/Utils.dart';
import 'package:application_authenticate_frontend_with_flutter/data/response/api_response.dart';
import 'package:application_authenticate_frontend_with_flutter/models/get_user_data_model.dart';
import 'package:application_authenticate_frontend_with_flutter/models/my_profile_models.dart';
import 'package:application_authenticate_frontend_with_flutter/repository/post_repository.dart';
import 'package:application_authenticate_frontend_with_flutter/repository/user_get_repository.dart';
import 'package:application_authenticate_frontend_with_flutter/res/color.dart';
import 'package:application_authenticate_frontend_with_flutter/res/components/input_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfilePageProvider with ChangeNotifier{

final nameController = TextEditingController();
final phoneController = TextEditingController();
final nameFocusNode = FocusNode();
final phoneFocusNode = FocusNode();




 bool _loading = false;
bool get loading => _loading;


   //TODO Create  setLoading function
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }




  final _myRepo = UserGetRepository();

  final _myPostRepo = PostRepository();




  final _socketResponse = StreamController<MyProfileModel>.broadcast();   //* <-- StreamController

  void Function(MyProfileModel) get addResponse => _socketResponse.sink.add;   //* add data functoin

  Stream<MyProfileModel> get getResponse => _socketResponse.stream.asBroadcastStream();  //* Get Data




  

  Future<void> getuserdataApi (String Token)async{

      _myRepo.getuserdata(Token).then((value){
       addResponse(value);
    }).onError((error, stackTrace){
       Utils.toastMessage(error.toString());
    });
    
    
  }







//TODO Create likePostAndDislikeApi Function 
  Future<void> likePostAndDislikeApi(var id, String token,BuildContext context)async{

    _myPostRepo.likePostAndUnlike(id,token).then((value){      //* <-- likePostAndUnlike function call
      
    
     }).onError((error, stackTrace){

        //  UserError userError = UserError.fromJson(error as Map<dynamic,dynamic>);
          Utils.toastMessage(error.toString());
        
         if(kDebugMode){ 
          
          print(error.toString());
       }
     });
  }









  
  // Future<void> getuserdataApi (String Token)async{

  //     setUserData(ApiResponse.loading());

  //      print('data loading');

  //     _myRepo.getuserdata(Token).then((value){

  //      setUserData(ApiResponse.completed(value));

  //      print('data this --> $value');

  //   }).onError((error, stackTrace){

  //      setUserData(ApiResponse.error(error.toString()));

  //   });
    
  // }













  //TODO 
  Future<void> ProfileUpdateApi(String token,data,BuildContext context)async{
      setLoading(true);

      try {
       var a = await _myRepo.userprofileupdate(token,data);
       setLoading(false);
        debugPrint(a.message);
        getuserdataApi(token);
        Utils.toastMessage(a.message.toString());
       
      } catch (e) {
        setLoading(false);
        debugPrint(e.toString());
      }
    






  }




  //TODO 
  Future<void> PhoneUpdateApi(String token,data,BuildContext context)async{
   
     
     try {
        var res = await _myRepo.phonenumberupdate(token,data);
         setLoading(false);
        debugPrint(res.message);
        getuserdataApi(token);
        Utils.toastMessage(res.message.toString());
        
     } catch (e) {
       debugPrint(e.toString());
     }
  }















 //* Yah hai User Name update karne ka code
Future<void> showUserNameDialogAlert(BuildContext context,String name,String token){
  nameController.text = name;
   return showDialog(context: context, builder:(context) {
       return AlertDialog(
        title: Text("Update Name"),
         content:SingleChildScrollView(
          child: Column(
            children: [
                InputTextField(
                  myController: nameController,
                   focusNode: nameFocusNode, 
                   onFitedSubmittedValue: (value){

                   }, 
                   onValidator: (value) {
                     
                   }, 
                   keyBoradType: TextInputType.text,
                    hint: "Enter name", 
                    obsureText: false)
            ],
              
          ),
          
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.alertColor),)),
            TextButton(onPressed: (){
               Navigator.pop(context);

               if(nameController.text.isEmpty){
                  Utils.ftushBarErrorMessage("Please Enter your name", context);
               }else{
                   
               Map data = {
                 "name":nameController.text.toString()
               };
               ProfileUpdateApi(token,data,context);

               }
               
              
               
            }, child: Text("Ok",style:Theme.of(context).textTheme.subtitle2))
          ],
       );
       
   },);
}









//* Yah hai Phone Number update karne DialogAlert ka code
Future<void> showPhoneDialogAlert(BuildContext context,String token, String phone){
  phoneController.text = phone;
   return showDialog(context: context, builder:(context) {
       return AlertDialog(
        title: Text("Update Phone"),
         content:SingleChildScrollView(
          child: Column(
            children: [

                InputTextField(
                  myController: phoneController,
                   focusNode: phoneFocusNode, 
                   onFitedSubmittedValue: (value){

                   }, 
                   onValidator: (value) {
                     
                   }, 
                   keyBoradType: TextInputType.text,
                    hint: "Enter Phone number", 
                    obsureText: false)
            ],
              
          ),
          
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.alertColor),)),
            TextButton(onPressed: (){
               Navigator.pop(context);
               
               if(phoneController.text.isEmpty){
                 
                 Utils.snackBar("plz Enter Phone number", context);
                 
               }else{


                Map data = {
                   "phone":phoneController.text.toString()
                };
               PhoneUpdateApi(token, data, context);
                
                 
               }
                
               
            }, child: Text("Ok",style:Theme.of(context).textTheme.subtitle2))
          ],
       );
       
   },);


   
}
  
  
  
}